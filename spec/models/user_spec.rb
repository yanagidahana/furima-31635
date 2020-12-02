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
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end
      it "emailに＠がないと保存できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください", "パスワード（確認用）とパスワードの入力が一致しません")
      end
      it "passwordが英数字混合だが、字数が5文字以下であれば登録できない" do
        @user.password = "000aa"
        @user.password_confirmation = "000aa"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it "passwordが半角数字のみでは登録できない" do
        @user.password = "000000"
        @user.valid?     
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it "passwordが半角英字のみでは登録できない" do
        @user.password = "aaaaaa"
        @user.valid?      
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it "passwordがないと登録できない" do
        @user.password = ""
        @user.valid? 
        expect(@user.errors.full_messages).to include("パスワードを入力してください", "パスワード（確認用）とパスワードの入力が一致しません")
      end  
      it "password_confirmationがないと登録できない" do
        @user.password_confirmation = ""
        @user.valid? 
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")    
      end
      it "passwordが存在してもpassword_confirmationと一致していないと登録できない" do
        @user.password_confirmation = ""
        @user.valid? 
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it "first_nameが空だと登録できない" do
        @user.first_name = ""
        @user.valid?    
        expect(@user.errors.full_messages).to include("お名前(全角)を入力してください", "お名前(全角)は不正な値です")
      end  
      it "last_nameが空だと登録できない" do
        @user.last_name = ""
        @user.valid?    
        expect(@user.errors.full_messages).to include("お名前(全角)を入力してください", "お名前(全角)は不正な値です")
      end  
      it "first_nameは漢字かひらがなかカタカナでなければ登録できない" do
        @user.first_name = "000000"
        @user.valid?  
        expect(@user.errors.full_messages).to include("お名前(全角)は不正な値です")
      end
      it "last_nameは漢字かひらがなかカタカナでなければ登録できない" do
        @user.last_name = "000000"
        @user.valid?  
        expect(@user.errors.full_messages).to include("お名前(全角)は不正な値です")
      end  
      it "first_name_kanaが空だと登録できない" do
        @user.first_name_kana = ""
        @user.valid?    
        expect(@user.errors.full_messages).to include("お名前カナ(全角)を入力してください", "お名前カナ(全角)は不正な値です")
      end  
      it "last_name_kanaが空だと登録できない" do
        @user.last_name_kana = ""
        @user.valid?  
        expect(@user.errors.full_messages).to include("お名前カナ(全角)を入力してください", "お名前カナ(全角)は不正な値です")
      end  
      it "first_name_kanaは全角カタカナでなければ登録できない" do
        @user.first_name_kana = "000000"
        @user.valid? 
        expect(@user.errors.full_messages).to include("お名前カナ(全角)は不正な値です")
      end  
      it "last_name_kanaは全角カタカナでなければ登録できない" do
        @user.last_name_kana = "000000"
        @user.valid?   
        expect(@user.errors.full_messages).to include("お名前カナ(全角)は不正な値です")
      end  
      it "birthdayが空だと登録できない" do
        @user.birthday = ""
        @user.valid?  
        expect(@user.errors.full_messages).to include("生年月日を入力してください")
      end  
    end
  end
end  