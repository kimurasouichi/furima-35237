require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザー新規登録ができる時' do
      it 'すべての情報が正しい時にユーザー登録できる' do
        expect(@user).to be_valid
      end
    end
    context 'ユーザー新規登録ができない時' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "ニックネームを入力してください"
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Eメールを入力してください"
      end

      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワード（確認用）とパスワードの入力が一致しません"
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = '11aaa'
        @user.password_confirmation = '11aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードは6文字以上の半角英数で入力ください"
      end

      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include "Eメールはすでに存在します"
      end

      it 'emailには「@」を含まないと登録ができない' do
        @user.email = 'tastcom'
        @user.valid?
        expect(@user.errors.full_messages).to include "Eメールは不正な値です"
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードを入力してください"
      end

      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "上の名前を入力してください"
      end

      it 'first_nameが空では登録できない ' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "下の名前を入力してください"
      end

      it 'パスワードが英語のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードは6文字以上の半角英数で入力ください"
      end

      it 'パスワードが数字のみでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワードは6文字以上の半角英数で入力ください"
      end

      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "上の名前のカナを入力してください"
      end

      it 'first_name_kanaが空では登録できない ' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "下の名前のカナを入力してください"
      end

      it 'last_nameが全角漢字・平仮名・カタカナ以外では登録できない ' do
        @user.last_name = '/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/i'
        @user.valid?
        expect(@user.errors.full_messages).to include "上の名前は全角で入力ください"
      end

      it 'first_nameが全角漢字・平仮名・カタカナ以外では登録できない ' do
        @user.first_name = '/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/i'
        @user.valid?
        expect(@user.errors.full_messages).to include "下の名前は全角で入力ください"
      end

      it 'last_name_kanaが全角カタカナ以外では登録できない' do
        @user.last_name_kana = '/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/i'
        @user.valid?
        expect(@user.errors.full_messages).to include "上の名前のカナは全角カナで入力ください"
      end

      it 'first_name_kanaが全角カタカナ以外では登録できない ' do
        @user.first_name_kana = '/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/i'
        @user.valid?
        expect(@user.errors.full_messages).to include "下の名前のカナは全角カナで入力ください"
      end

      it 'last_name_kanaがカタカナ以外の全角文字だと登録できないこと ' do
        @user.last_name_kana = '/\A[ぁ-んァ-ン一-龥]/'
        @user.valid?
        expect(@user.errors.full_messages).to include "上の名前のカナは全角カナで入力ください"
      end

      it 'first_name_kanaがカタカナ以外の全角文字だと登録できないこと ' do
        @user.first_name_kana = '/\A[ぁ-んァ-ン一-龥]/'
        @user.valid?
        expect(@user.errors.full_messages).to include "下の名前のカナは全角カナで入力ください"
      end
    end
  end
end
