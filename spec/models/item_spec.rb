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
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end

      it '商品名が空では保存できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end

      it '商品の説明が空では保存できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Description can't be blank"
      end

      it 'カテゴリーが空では保存できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end

      it '商品の状態についての情報が空では保存できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Condition can't be blank"
      end

      it '配送料の負担についての情報が空では保存できない' do
        @item.burden_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Burden can't be blank"
      end

      it '発送元の地域の情報が空では保存できない' do
        @item.area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Area can't be blank"
      end

      it '発送までの日数の情報が空では保存できない' do
        @item.day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Day can't be blank"
      end

      it '販売価格の情報が空では保存できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end

      it '販売価格は、¥0〜299の間の値段では保存できない' do
        @item.price = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price Out of setting range'
      end

      it '販売価格は、¥10,000,000以上の値段では保存できない' do
        @item.price = 10, 0o00, 0o00
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price Out of setting range'
      end

      it '販売価格は半角数字でないと保存できない' do
        @item.price = 'あいうえお'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price Out of setting range'
      end

      it 'active_hash、category_idのidが１のときは登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Category Select'
      end

      it 'active_hash、condition_idのidが１のときは登録できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Condition Select'
      end

      it 'active_hash、burden_idのidが１のときは登録できない' do
        @item.burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Burden Select'
      end

      it 'active_hash、area_idのidが１のときは登録できない' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Area Select'
      end

      it '商品名が４１文字以上では登録できない' do
        @item.name = 'a' * 41
        @item.valid?
        expect(@item.errors.full_messages).to include 'Name is too long (maximum is 40 characters)'
      end

      it '商品説明が１００１文字以上では登録できない' do
        @item.description = 'a' * 1001
        @item.valid?
        expect(@item.errors.full_messages).to include 'Description is too long (maximum is 1000 characters)'
      end

      it 'userが紐付いていない場合は登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
