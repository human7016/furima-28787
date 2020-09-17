class OrdersController < ApplicationController
  before_action :find_item, only: [:index, :create, :move_to_index, :pay_item]
  before_action :move_to_user_session
  before_action :move_to_index

  def index
    @order = UserOrder.new
  end

  def create
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

  def find_item
    @item = Item.find(params[:item_id])
  end

  def move_to_user_session
    redirect_to new_user_session_path unless user_signed_in?
  end

  def move_to_index
    redirect_to root_path if current_user.id == @item.user.id || !@item.purchase_history.nil?
  end

  def order_params
    params.require(:user_order).permit(:postal_code, :prefectures_id, :city, :address, :building, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: order_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類(日本円)
    )
  end
end
