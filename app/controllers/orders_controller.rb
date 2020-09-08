class OrdersController < ApplicationController
  before_action :move_to_user_session
  before_action :move_to_index

  def index
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
end
