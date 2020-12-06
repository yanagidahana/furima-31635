class ItemsController < ApplicationController

  before_action :authenticate_user!,only: [:new, :create, :destroy, :edit, :update]
  before_action :set_item, only:[:show, :edit, :update, :destroy]


  def index
    @item = Item.all.order("created_at DESC")
  end

  def new
    @item = ItemTag.new
  end

  def create
    @item = ItemTag.new(item_params)
    if @item.valid?
       @item.save
       return redirect_to root_path
     else
      render :new
    end
  end

  def show
  end

  def edit
    if current_user.id != @item.user.id
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else  
      render :edit
    end  
  end  

  def destroy
    if current_user.id == @item.user.id
    @item.destroy
  end
    redirect_to root_path
  end

  private
  def item_params
    params.require(:items_tsg).permit(:name, :category_id, :status_id, :shipping_id, :shipping_place_id, :date_shipment_id, :explanation, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
   @item = Item.find(params[:id])
  end
end  