require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品の保存ができる時' do
      it 'すべての情報が正しい時に保存される' do
        expect(@item).to be_valid
      end
    end
    context '商品出品の保存ができない時' do
      it '商品画像が空では保存できない' do
        @itme.image = ''
        @itme.valid?
        expect(@item.errors.full_messages).to include "Imag can't be blank"
      end

      it '商品名が空では保存できない' do
        @itme.name = ''
        @itme.valid?
        expect(@item.errors.full_messages).to include "Email can't be blank"
      end

      it '商品の説明が空では保存できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      it 'カテゴリーが空では保存できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
      end

      it '商品の状態についての情報が空では保存できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
      end

      it '配送料の負担についての情報が空では保存できない' do
        @item.burden_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
      end

      it '発送元の地域の情報が空では保存できない' do
        @item.area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
      end

      it '発送までの日数の情報が空では保存できない' do
        @item.day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
      end

      it '販売価格の情報が空では保存できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
      end

      it '販売価格は、¥300〜¥9,999,999の間でないと保存できない' do
      end

      it '販売価格は半角数字でないと保存できない' do
        @item.price = '/\A[0-9]+\z/'
        @item.valid?
        expect(@item.errors.full_messages).to include('Password Include both letters and numbers')
      end
    end
  end
end
