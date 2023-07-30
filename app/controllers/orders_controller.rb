class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_item, only: :index
  before_action :move_to_index, only: :index

  def index
  end

  private

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
