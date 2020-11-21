require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "nicknameが6文字以下で登録できる" do
        @user.nickname = "aaaaaa"
        expect(@user).to be_valid
      end
      it "passwordが6文字以上であれば登録できる" do
        @user.password = "aaa000"
        @user.password_confirmation = "aaa000"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "emailに＠がないと保存できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが英数字混合だが、字数が5文字以下であれば登録できない" do
        @user.password = "000aa"
        @user.password_confirmation = "000aa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordが半角数字のみでは登録できない" do
        @user.password = "000000"
        @user.valid?       
        expect("Password confirmation doesn't match Password")
      end
      it "passwordが半角英字のみでは登録できない" do
        @user.password = "aaaaaa"
        @user.valid?      
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "passwordがないと登録できない" do
        @user.password = ""
        @user.valid? 
        expect(@user.errors.full_messages).to include("Password can't be blank", "Password confirmation doesn't match Password")
      end  
      it "password_confirmationがないと登録できない" do
        @user.password_confirmation = ""
        @user.valid? 
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")    
      end
      it "passwordが存在してもpassword_confirmationと一致していないと登録できない" do
        @user.password_confirmation = ""
        @user.valid? 
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "first_nameが空だと登録できない" do
        @user.first_name = ""
        @user.valid?    
        expect(@user.errors.full_messages).to include("First name can't be blank", "First name is invalid")
      end  
      it "last_nameが空だと登録できない" do
        @user.last_name = ""
        @user.valid?    
        expect(@user.errors.full_messages).to include("Last name can't be blank", "Last name is invalid")
      end  
      it "first_nameは漢字かひらがなかカタカナでなければ登録できない" do
        @user.first_name = "000000"
        @user.valid?  
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it "last_nameは漢字かひらがなかカタカナでなければ登録できない" do
        @user.last_name = "000000"
        @user.valid?  
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end  
      it "first_name_kanaが空だと登録できない" do
        @user.first_name_kana = ""
        @user.valid?    
        expect(@user.errors.full_messages).to include("First name kana can't be blank", "First name kana is invalid")
      end  
      it "last_name_kanaが空だと登録できない" do
        @user.last_name_kana = ""
        @user.valid?  
        expect(@user.errors.full_messages).to include("Last name kana can't be blank", "Last name kana is invalid")
      end  
      it "first_name_kanaは全角カタカナでなければ登録できない" do
        @user.first_name_kana = "000000"
        @user.valid? 
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end  
      it "last_name_kanaは全角カタカナでなければ登録できない" do
        @user.last_name_kana = "000000"
        @user.valid?   
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end  
      it "birthdayが空だと登録できない" do
        @user.birthday = ""
        @user.valid?  
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end  
    end
  end  
end