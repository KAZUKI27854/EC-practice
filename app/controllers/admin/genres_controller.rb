class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @genre = Genre.new
    @genres = Genre.all
  end
  
  def create
    @genre = Genre.new(params_genre)
    @genres = Genre.all
    if @genre.save
      redirect_to admin_genres_path
    else
      render :index
    end
  end
  
  private

  def params_genre
    params.require(:genre).permit(:name)
  end
end
