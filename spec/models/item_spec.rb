require 'rails_helper'
describe Item do
  before do
    user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item, user_id: user.id)
  end

  describe '商品出品' do
    context '出品がうまくいくとき' do
      it "categoryとstatus、shippingとshipping_place、date_shipmentが存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end   

    context '出品がうまくいかないとき' do
      it "imageが空だと登録できない" do
        @item.image = nil
        @item.valid? 
      expect(@item.errors.full_messages).to include("Image can't be blank", "Price Price Half-width number")
      end   
      it "nameが空だと登録できない" do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank", "Price Price Half-width number")
      end   
      it "explanationが空だと登録できない" do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank", "Price Price Half-width number")
      end   
      it "priceが空だと登録できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", "Price is not a number", "Price Price Half-width number")
      end 
      it "priceが299以下であれば登録できない" do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300", "Price Price Half-width number")
      end   
      it "priceが¥10000000以上であれば登録できない" do
        @item.price = 11111111
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999", "Price Price Half-width number")
      end   
      it "priceが半角数字でなければ登録できない" do
        @item.price = 'zzzzz'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number", "Price Price Half-width number")
      end  
      it "categoryが0では登録できない" do
        @item.price = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300", "Price Price Half-width number")
      end  
      it "statusが0では登録できない" do
        @item.price = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300", "Price Price Half-width number")
      end  
      it "shippingが0では登録できない" do
        @item.price = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300", "Price Price Half-width number")
      end  
      it "shipping_placeが0では登録できない" do
        @item.price = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300", "Price Price Half-width number")
      end  
      it "date_shipmentが0では登録できない" do
        @item.price = 0
        @item.valid?
        binding.pry
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300", "Price Price Half-width number")
      end  



   end     
  end
end  

