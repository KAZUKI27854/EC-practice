class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!
  
  def new
    @item = Item.new
    @genres = Genre.all
  end
  
  def create
    @item = Item.new(params_item)
    
    if @item.save
      redirect_to admin_item_path(@item)
    else
      @genres = Genre.all
      render :new
    end
  end
  
  private

  def params_item
    params.require(:item).permit(:name, :caption, :price, :genre_id, :is_active, :image)
  end
end
