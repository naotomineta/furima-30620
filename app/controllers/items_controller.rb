class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
   
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to action: :index
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :info, :sales_status_id, :shipping_fee_status_id, :prefecture_id, :schedule_delivery_id,:category_id, :image).merge(user_id: current_user.id)
  end
end
