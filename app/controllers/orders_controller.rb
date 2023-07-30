class OrdersController < ApplicationController
  before_action :authenticate_user!, only:[:index, :create]
  before_action :set_item, only:[:index, :create]
  before_action :move_to_index, only: :index

  def index
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order).permit(
      :postal_code, 
      :prefecture_id, 
      :city, 
      :address, 
      :building,
      :phone_number
    ).merge(
      price: @item.price, 
      item_id: @item.id, 
      user_id: current_user.id, 
      token: params[:token]
    )
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

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: order_params[:price],
      card: order_params[:token],
      currency:'jpy'
    )
 end

end
