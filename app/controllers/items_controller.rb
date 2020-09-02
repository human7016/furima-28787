class ItemsController < ApplicationController
  
  def index
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(tweet_params)
    if @article.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_paramas
    params.require(:item).permit(:image, :name, :explanation, :price, :category, :quality, :delivery_fee, :shipping_area, :shipping_date).merge(user_id:current_user.id)
  end
end
