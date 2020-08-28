require 'rails_helper'
RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it "nicknameが空だと登録できない" do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "emailが空だと登録できない" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "重複したemailが存在する場合登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
     expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

     it "emailに＠が含まていないと登録できないこと" do
      @user.email = "aaaaa"
      @user.valid?
     end

     it "passwordが空だと登録できない" do
       @user.password = nil
       @user.valid?
       expect(@user.errors.full_messages).to include("Password can't be blank")
     end

     it "passwordが6文字以上であれば登録できること" do
      @user.password = "123456"
      @user.password_confirmation = "123456"
      expect(@user).to be_valid
    end

     it "passwordが5文字以下であれば登録できないこと" do
      @user.password = "12345"
      @user.password_confirmation = "12345"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
     end

     it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

     it "first_nameが空では登録できないこと" do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
     end

     it "first_nameは半角では登録できないこと" do
      @user.first_name = "aaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
     end

     it "last_nameが空では登録できないこと" do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
     end

     it "last_nameは半角では登録できないこと" do
      @user.last_name = "aaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
     end

     it "first_name_kanaは空では登録できないこと" do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
     end

     it "first_name_kanaは全角カナ以外では登録できないこと" do
      @user.first_name_kana = "1aあ一"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
     end

     it "last_name_kanaは空では登録できないこと" do
      @user.last_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
     end

     it "last_name_kanaは全角カナ以外では登録できないこと" do
      @user.last_name_kana = "1aあ一"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid")
     end


     it "birth_dateが空では登録できないこと" do
      @user.birth_date = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth date can't be blank")
     end
     
  end
end      