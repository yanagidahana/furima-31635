class RecordsController < ApplicationController
  before_action :set_item, only:[:index, :create]

  def index
    @buy = Buy.new
  end

  def create
    @buy = Buy.new(record_params)
    if @buy.valid?
      @buy.save
      redirect_to action: :index
    else
      render action: :index
    end
  end
  
  
  private
  def record_params
    params.require(:buy).permit(:postcode, :shipping_place_id, :city, :block, :building, :phone).merge(user_id: current_user.id, item_id: @item.id)
  end
  
  def set_item
    @item = Item.find(params[:item_id])
  end
  
end
