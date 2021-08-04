class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!
  
  def new
    @item = Item.new
    @genres = Genre.all
  end
  
  private

  def params_item
    params.require(:item).permit(:name, :caption, :price, :genre_id, :is_active, :image)
  end
end
