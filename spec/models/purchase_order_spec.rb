require 'rails_helper'

RSpec.describe PurchaseOrder, type: :model do
  describe '#create' do
    before do
      @purchase_order = FactoryBot.build(:purchase_order)
    end

    context '新規登録がうまくいくとき' do
      it '郵便場号と都道府県と市区町村と番地と電話番号とトークンが存在すれば登録できる' do
        expect(@purchase_order).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it '郵便番号が空だと登録できないこと' do
        @purchase_order.postal_code = nil
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Postal code can't be blank")
      end

       it '郵便番号にはハイフンがないと登録できないこと' do
        @purchase_order.postal_code = '2222222'
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Postal code is invalid")
      end

      it '都道府県が空だと登録できないこと' do
        @purchase_order.delivery_area_id = 1
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Delivery area must be other than 1")
      end

      it '市区町村が空だと登録できないこと' do
        @purchase_order.city = nil
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空だと登録できないこと' do
        @purchase_order.address = nil
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Address can't be blank")
      end

      it '電話番号が空だと登録できないこと' do
        @purchase_order.phone_number = nil
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号にはハイフンがあると、登録できないこと' do
        @purchase_order.phone_number = '090-2222-2222'
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Phone number is invalid")
      end

      it '電話番号は11文字以内でないと登録できないこと' do
        @purchase_order.phone_number = '090123456789'
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end

      it 'トークンが空だと登録できないこと' do
        @purchase_order.token = nil
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Token can't be blank")
      end

    end
  end
end
