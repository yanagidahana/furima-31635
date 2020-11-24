class ItemsController < ApplicationController

  before_action :authenticate_user!,only: [:new, :cleate, ]

  def index
    @item = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
     else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :category_id, :status_id, :shipping_id, :shipping_place_id, :date_shipment_id, :explanation, :price, :image).merge(user_id: current_user.id)
  end

end
