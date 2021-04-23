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
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end

      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end

      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = '11aaa'
        @user.password_confirmation = '11aaa'
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

      it 'emailには「@」を含まないと登録ができない' do
        @user.email = 'tastcom'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Email is invalid'
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

      it 'パスワードが英語のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password Include both letters and numbers'
      end

      it 'パスワードが数字のみでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
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
        @user.last_name_kana = '/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/i'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name kana kana Full-width katakana characters'
      end

      it 'first_name_kanaが全角カタカナ以外では登録できない ' do
        @user.first_name_kana = '/\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/i'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name kana kana Full-width katakana characters'
      end
    end
  end
end
