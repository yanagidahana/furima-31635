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
      expect(@item.errors.full_messages).to include("Image can't be blank")
      end   
      it "nameが空だと登録できない" do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end   
      it "explanationが空だと登録できない" do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end   
      it "priceが空だと登録できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", "Price is not a number", "Price Price Half-width number")
      end 
      it "priceが299以下であれば登録できない" do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end   
      it "priceが¥10000000以上であれば登録できない" do
        @item.price = 1000000000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end   
      it "priceが半角数字でなければ登録できない" do
        @item.price = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number", "Price Price Half-width number")
      end  
      it "categoryが0では登録できない" do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 0")
      end  
      it "statusが0では登録できない" do
        @item.status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 0")
      end  
      it "shippingが0では登録できない" do
        @item.shipping_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping must be other than 0")
      end  
      it "shipping_placeが0では登録できない" do
        @item.shipping_place_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping place must be other than 0")
      end  
      it "date_shipmentが0では登録できない" do
        @item.date_shipment_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Date shipment must be other than 0")
      end  
   end     
  end
end  

