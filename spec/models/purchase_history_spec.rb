require 'rails_helper'

RSpec.describe PurchaseHistory, type: :model do
  before do
    @purchase_history = FactoryBot.build(:purchase_history)
  end

  describe '購入履歴新規作成' do
    context '作成がうまくいくとき' do
      it '商品のidと購入者のidがあれば登録できる' do
        expect(@purchase_history).to be_valid
      end
    end

    context '作成がうまくいかないとき' do
      it '商品のidがなければ登録できない' do
        @purchase_history.item_id = nil
        @purchase_history.valid?
        expect(@purchase_history.errors.full_messages).to include("Item must exist")
      end
      it '購入者のidがなければ登録できない' do
        @purchase_history.user_id = nil
        @purchase_history.valid?
        expect(@purchase_history.errors.full_messages).to include("User must exist")
      end
    end
  end
end
