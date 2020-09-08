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
    @order = UserOrder.new(order_params)
    @token = Token.new(token_params) #tokenが有効か判断
    if @token.valid?
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
    item = Item.find(params[:item_id])
    if current_user.id == item.user.id || item.purchase_histroy != nil
      redirect_to root_path
    end
  end

  def order_params
    params.require(:user_order).permit(:postal_code, :prefectures, :city, :address, :building, :phone_number)
  end

  def token_params
    params.permit(:token)
  end

  def pay_item
    Payjp.api_key = "sk_test_af1efa431ab6bae0fec963d4"  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: order_params[:price],  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end
end
