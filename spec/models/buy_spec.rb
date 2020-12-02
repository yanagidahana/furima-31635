require 'rails_helper'
describe Buy do
  before do
    seller = FactoryBot.create(:user)
    item = FactoryBot.create(:item, user_id: seller.id)
    buyer = FactoryBot.create(:user)
    @buy = FactoryBot.build(:buy, user_id: buyer.id, item_id: item.id)
    sleep(1)
  end
  
  describe '商品購入' do
    context '商品購入が上手くいく時' do
      it "postcodeとshipping_place_idとcityとblockとphoneが存在すれば登録できる" do
        expect(@buy).to be_valid
      end

      it "buildingは空でも登録できる" do
        @buy.building = nil
        @buy.valibrew install git-secrets
        expect(@buy).to be_valid
      end   
    end

     context '購入がうまくいかないとき' do
       it "postcodeが空だと登録できない" do
         @buy.postcode = nil
         @buy.valid? 
       expect(@buy.errors.full_messages).to include("郵便番号を入力してください", "郵便番号はハイフンを入力して下さい")
     end   

       it "shipping_place_idが空だと登録できない" do
         @buy.shipping_place_id = nil
         @buy.valid?
       expect(@buy.errors.full_messages).to include("都道府県を入力してください", "都道府県を入力して下さい")
       end

       it "cityが空だと登録できない" do
         @buy.city = nil
         @buy.valid? 
       expect(@buy.errors.full_messages).to include("市区町村を入力してください")
       end

       it "blockが空だと登録できない" do
         @buy.block = nil
         @buy.valid? 
       expect(@buy.errors.full_messages).to include("番地を入力してください")
       end

       it "phoneが空だと登録できない" do
         @buy.phone = nil
         @buy.valid? 
       expect(@buy.errors.full_messages).to include("電話番号を入力してください", "電話番号は数値で入力してください")
       end   

       it "postcodeにハイフンがないと登録できない" do
         @buy.postcode = "0000000"
         @buy.valid?
       expect(@buy.errors.full_messages).to include("郵便番号はハイフンを入力して下さい")
       end

       it "phoneにハイフンがあると登録できない" do
         @buy.phone = "000-00000000"
         @buy.valid? 
       expect(@buy.errors.full_messages).to include("電話番号は数値で入力してください")
       end

       it "phoneが12桁以上だと登録できない" do
        @buy.phone = "000-0000-00000"
        @buy.valid? 
      expect(@buy.errors.full_messages).to include("電話番号は数値で入力してください", "電話番号は12文字以内で入力してください")
      end   


       it "tokenが空だと登録できない" do
        @buy.token = nil
        @buy.valid? 
      expect(@buy.errors.full_messages).to include("カード情報を入力してください")
      end

      it "shipping_place_idが0だと登録できない" do
        @buy.shipping_place_id = 0
        @buy.valid? 
      expect(@buy.errors.full_messages).to include("都道府県を入力して下さい")
      end   
     end
  end
end
