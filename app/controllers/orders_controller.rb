class OrdersController < ApplicationController
  before_action :move_to_user_session
  before_action :move_to_index

  def index
    @item = Item.find(params[:item_id])
  end

  def new
    @order = UserOrder.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order = UserOrder.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def move_to_user_session
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user.id || @item.purchase_history != nil
      redirect_to root_path
    end
  end

  def order_params
    params.permit(:postal_code, :prefectures_id, :city, :address, :building, :phone_number, :item_id, :token).merge(user_id:current_user.id)
  end

  def token_params
    params.permit(:token)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
    @item = Item.find(params[:item_id])
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end
end