require 'rails_helper'

RSpec.describe Address, type: :model do
  before do
    @address = FactoryBot.build(:address)
  end

  describe '住所テーブル作成' do
    context '作成がうまくいくとき' do
      it '全ての情報があれば登録できる' do
        expect(@address).to be_valid
      end
    end

    context '作成がうまくいかないとき' do
      it '購入履歴がなければ登録できない' do
        @address.purchase_history_id = nil
        @address.valid?
        expect(@address.errors.full_messages).to include
      end
      it '郵便番号がなければ登録できない' do
        @address.postal_code = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号はハイフンがないと登録できない' do
        @address.postal_code = '1234567'
        @address.valid?
        expect(@address.errors.full_messages).to include('Postal code is invalid')
      end
      it '郵便番号はハイフンの前に数字が3で桁ないと登録できない' do
        @address.postal_code = '12-4567'
        @address.valid?
        expect(@address.errors.full_messages).to include('Postal code is invalid')
      end
      it '郵便番号はハイフンの後に数字が4桁でないと登録できない' do
        @address.postal_code = '123-45678'
        @address.valid?
        expect(@address.errors.full_messages).to include('Postal code is invalid')
      end
      it '都道府県の情報がないと登録できない' do
        @address.purchase_history_id = nil
        @address.valid?
        expect(@address.errors.full_messages).to include('Purchase history must exist')
      end
      it '都道府県選択の番号が1だと登録できない' do
        @address.purchase_history_id = 1
        @address.valid?
        expect(@address.errors.full_messages).to include('Purchase history must exist')
      end
      it '市区町村の情報がないと登録できない' do
        @address.city = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("City can't be blank")
      end
      it '市区町村は全角文字でないと登録できない' do
        @address.city = '全角文字ではない1'
        @address.valid?
        expect(@address.errors.full_messages).to include('City is invalid')
      end
      it '番地の情報がないと登録できない' do
        @address.address = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号がないと登録できない' do
        @address.phone_number = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号は数字でないと登録できない' do
        @address.phone_number = '壱234567890'
        @address.valid?
        expect(@address.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号は9桁以下では登録できない' do
        @address.phone_number = '123456789'
        @address.valid?
        expect(@address.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号は12桁以上では登録できない' do
        @address.phone_number = '123456789012'
        @address.valid?
        expect(@address.errors.full_messages).to include('Phone number is invalid')
      end
    end
  end
end
