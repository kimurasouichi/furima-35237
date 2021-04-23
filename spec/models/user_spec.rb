require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザー新規登録ができる時' do
      it 'メールアドレスは、@が必須であること' do
        expect(@user).to be_valid
      end

      it 'パスワードは、6文字以上での入力が必須であること' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
      end

      it 'パスワードとパスワード（確認用）、値の一致が必須であること' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
    context 'ユーザー新規登録ができない時' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end

      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
      end

      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end

      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank"
      end

      it 'first_nameが空では登録できない ' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank"
      end

      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana can't be blank"
      end

      it 'first_name_kanaが空では登録できない ' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank"
      end

      it 'last_nameが全角漢字・平仮名・カタカナ以外では登録できない ' do
        @user.last_name = '/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/i'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name Full-width characters'
      end

      it 'first_nameが全角漢字・平仮名・カタカナ以外では登録できない ' do
        @user.first_name = '/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/i'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name Full-width characters'
      end

      it 'last_name_kanaが全角カタカナ以外では登録できない' do
        @user.last_name = '/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/i'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name Full-width characters'
      end

      it 'first_name_kanaが全角カタカナ以外では登録できない ' do
        @user.first_name = '/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/i'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name Full-width characters'
      end
    end
  end
end
