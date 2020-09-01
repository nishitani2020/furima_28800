require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/images/test_image.jpg')
    end

    it '画像が空だと登録できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it '商品名が空だと登録できないこと' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it '商品の説明が空だと登録できないこと' do
      @item.explanation = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Explanation can't be blank")
    end

    it 'カテゴリーの情報が空だと登録できないこと' do
      @item.category = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Category is not a number')
    end

    it '商品の状態が空だと登録できないこと' do
      @item.status = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Status is not a number')
    end

    it '配送料の負担が空だと登録できないこと' do
      @item.delivery_cost = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Delivery cost is not a number')
    end

    it '発送元の地域が空だと登録できないこと' do
      @item.delivery_area = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Delivery area is not a number')
    end

    it '発送までの日数が空だと登録できないこと' do
      @item.delivery_day = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('Delivery day is not a number')
    end

    it '価格が空だと登録できないこと' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it '価格が¥300~¥9,999,999の範囲でないと登録できないこと' do
      @item.price = 200
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not included in the list')
    end

    it '価格が半角数字以外では登録できないこと' do
      @item.price = 'aあ１一'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is not included in the list')
    end
  end
end
