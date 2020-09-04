require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/test_image.png')
  end

  describe '商品登録' do
    context '商品登録がうまくいくとき' do
      it '商品登録情報が全て存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品登録がうまくいかないとき' do
      it '商品画像がないと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名がないと登録できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品の説明がないと登録できない' do
        @item.explanation = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'カテゴリーの情報がないと登録できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'カテゴリーの情報がデフォルトのままだと登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it '商品の状態についての情報がないと登録できない' do
        @item.quality_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Quality can't be blank")
      end
      it '商品の状態についての情報がデフォルトのままだと登録できない' do
        @item.quality_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Quality must be other than 1')
      end
      it '配送料の負担についての情報がないと登録できない' do
        @item.delivery_fee_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
      end
      it '配送料の負担についての情報がデフォルトのままだと登録できない' do
        @item.delivery_fee_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery fee must be other than 1')
      end
      it '発送元の地域についての情報がないと登録できない' do
        @item.shipping_area_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area can't be blank")
      end
      it '発送元の地域についての情報がデフォルトのままだと登録できない' do
        @item.shipping_area_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping area must be other than 1')
      end
      it '発送までの日数についての情報がないと登録できない' do
        @item.shipping_date_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping date can't be blank")
      end
      it '発送までの日数についての情報がデフォルトのままだと登録できない' do
        @item.shipping_date_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping date must be other than 1')
      end
      it '価格の情報がないと登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it '価格が300円より小さいと登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it '価格が10000000以上だと登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than 10000000')
      end
      it '価格が半角数字以外だと登録できない' do
        @item.price = 'aasdf'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
    end
  end
end
