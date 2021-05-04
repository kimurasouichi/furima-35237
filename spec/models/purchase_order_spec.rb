require 'rails_helper'

RSpec.describe PurchaseOrder, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_order = FactoryBot.build(:purchase_order, user_id: user.id, item_id: item.id)
      sleep 2
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_order).to be_valid
      end
      it '建物番号のカラムが空だった場合でも保存できること' do
        @purchase_order.building_name = ''
        expect(@purchase_order).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeが空だと保存できないこと' do
        @purchase_order.post_code = ''
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("郵便番号を入力してください")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchase_order.post_code = '1234567'
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("郵便番号は(-)つきでお願いします")
      end
      it 'active_hash、area_idのidが１のときは登録できない' do
        @purchase_order.area_id = 1
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("都道府県を選択してください")
      end
      it 'cityが空だと保存できないこと' do
        @purchase_order.city = ''
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("市区町村を入力してください")
      end
      it 'addressが空だと保存できないこと' do
        @purchase_order.address = ''
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("番地を入力してください")
      end
      it 'phone_numberが空だと保存できないこと' do
        @purchase_order.phone_number = nil
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("電話番号を入力してください")
      end
      it 'userが紐付いていないと保存できないこと' do
        @purchase_order.user_id = nil
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Userを入力してください")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @purchase_order.item_id = nil
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("Itemを入力してください")
      end
      it 'tokenが空では登録できないこと' do
        @purchase_order.token = nil
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("クレジットカード情報を入力してください")
      end
      it '電話番号は英数混合では登録できないこと' do
        @purchase_order.phone_number = '0901234123a'
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("電話番号は半角数値で入力してください")
      end
      it '電話番号は１１桁以内の数値でないと登録できないこと' do
        @purchase_order.phone_number = '0901234123a'
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("電話番号は半角数値で入力してください")
      end
      it '電話番号は１２桁以上では登録できないこと' do
        @purchase_order.phone_number = '090123412345'
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("電話番号は11文字以内で入力してください")
      end
      it '電話番号は９桁以下では登録できないこと' do
        @purchase_order.phone_number = '123456789'
        @purchase_order.valid?
        expect(@purchase_order.errors.full_messages).to include("電話番号は10桁または11桁で入力してください")
      end
    end
  end
end
