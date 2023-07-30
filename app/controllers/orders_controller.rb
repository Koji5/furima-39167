class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_item, only:[:index, :create]
  before_action :move_to_index, only: :index

  def index
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order).permit(:postal_code, :prefecture_id, :city, :address, :building, :price).merge(item_id: @item.id, user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    if current_user.id == @item.user_id
      redirect_to root_path
    end
    # TODO:売却済み商品かどうかの条件分岐
  end
end
