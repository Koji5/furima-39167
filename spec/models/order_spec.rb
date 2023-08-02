require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '商品購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order = FactoryBot.build(:order, user_id: user.id, item_id: item.id)
    end

    context '商品が購入できる場合' do
      it "すべての値が正しく入力されていれば保存できること" do
        expect(@order).to be_valid
      end
      it "buildingは空でも保存できること" do
        @order.building = ''
        expect(@order).to be_valid
      end
    end

    context '商品が購入できない場合' do
      it "priceが空では購入できないこと" do
        @order.price = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Price can't be blank")
      end
      it "tokenが空では購入できないこと" do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
      it "郵便番号が空では購入できないこと" do
        @order.postal_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank")
      end
      it "郵便番号が「3桁ハイフン4桁」の半角文字列以外では購入できないこと" do
        @order.postal_code = '1234'
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it "都道府県が空では購入できないこと" do
        @order.prefecture_id = 1
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "市区町村が空では購入できないこと" do
        @order.city = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end
      it "番地が空では購入できないこと" do
        @order.address = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Address can't be blank")
      end
      it "電話番号が空では購入できないこと" do
        @order.phone_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end
      it "9桁以下では購入できないこと" do
        @order.phone_number = '123456789'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid.")
      end
      it "12桁以上では購入できないこと" do
        @order.phone_number = '123456789012'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid.")
      end
      it "半角数字以外が含まれている場合、購入できないこと" do
        @order.phone_number = '12a4567890'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid.")
      end
      it 'itemが紐付いていないと購入できないこと' do
        @order.item_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end
      it 'userが紐付いていないと購入できないこと' do
        @order.user_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end
