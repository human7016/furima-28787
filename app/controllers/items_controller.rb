class ItemsController < ApplicationController
  before_action :find, only: [:show, :edit, :update]
  def index
    @item = Item.all.order(created_at: :DESC)
  end

  def new
    @item = Item.new
  end

  def create
    item = Item.new(item_params)
    if item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :explanation, :price, :category_id, :quality_id, :delivery_fee_id, :shipping_area_id, :shipping_date_id).merge(user_id: current_user.id)
  end

  # 特定のアクションのときにbefore_actionで読み込む
  def find
    @item = Item.find(params[:id])
  end
end
