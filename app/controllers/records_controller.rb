class RecordsController < ApplicationController
  before_action :set_item, only:[:index, :create]

  def index
    @buy = Buy.new
  end

  def create
    @buy = Buy.new(record_params)
    if @buy.valid?
      @buy.save
      pay_item
      redirect_to root_path
    else
      render action: :index
    end
  end

  
  private
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount:  @item.price,
      card: record_params[:token],
      currency:'jpy'
    )
 end

  def record_params
    params.require(:buy).permit(:postcode, :shipping_place_id, :city, :block, :building, :phone, :token).merge(user_id: current_user.id, item_id: @item.id)
  end
  
  def set_item
    @item = Item.find(params[:item_id])
  end
  
end
