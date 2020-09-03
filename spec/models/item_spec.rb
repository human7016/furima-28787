require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '商品新規登録' do
    context '新規登録がうまくいくとき' do
      it "商品登録情報が全て存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end
  end
end
