require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload("public/images/test_image.png")
  end

  describe '商品登録' do
    context '商品登録がうまくいくとき' do
      it "商品登録情報が全て存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end

    context '商品登録がうまくいかないとき' do
      it "商品画像がないと登録できない" do
      end
    end
  end
end
