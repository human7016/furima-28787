require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  before do
    @order = FactoryBot.build(:user_order)
  end

  describe '購入情報の保存' do
    context '保存がうまくいくとき' do
      it '全ての情報があれば登録できる' do
        expect(@order).to be_valid
      end
      it "建物の情報がなくても登録ができる" do
        @order.building = nil
        expect(@order).to be_valid
      end
    end

    context '保存がうまくいかないとき' do
      #PurchaseHistoryモデルに関するテスト
      it '商品のidがなければ登録できない' do
        @order.item_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end
      it '郵便番号がなければ登録できない' do
        @order.postal_code = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号はハイフンがないと登録できない' do
        @order.postal_code = '1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include('Postal code is invalid')
      end
      it '郵便番号はハイフンの前に数字が3で桁ないと登録できない' do
        @order.postal_code = '12-4567'
        @order.valid?
        expect(@order.errors.full_messages).to include('Postal code is invalid')
      end
      it '郵便番号はハイフンの後に数字が4桁でないと登録できない' do
        @order.postal_code = '123-45678'
        @order.valid?
        expect(@order.errors.full_messages).to include('Postal code is invalid')
      end
      it '都道府県の情報がないと登録できない' do
        @order.prefectures_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefectures can't be blank")
      end
      it '都道府県選択の番号が1だと登録できない' do
        @order.prefectures_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefectures must be other than 1")
      end
      it '市区町村の情報がないと登録できない' do
        @order.city = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end
      it '市区町村は全角文字でないと登録できない' do
        @order.city = '全角文字ではない1'
        @order.valid?
        expect(@order.errors.full_messages).to include('City is invalid')
      end
      it '番地の情報がないと登録できない' do
        @order.address = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号がないと登録できない' do
        @order.phone_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号は数字でないと登録できない' do
        @order.phone_number = '壱234567890'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号は9桁以下では登録できない' do
        @order.phone_number = '123456789'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号は12桁以上では登録できない' do
        @order.phone_number = '123456789012'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone number is invalid')
      end
      #モデルに保存しないものに関するテスト
      it 'トークンがないと保存できない' do
        @order.token = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
