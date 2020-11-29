require 'rails_helper'
describe Buy do
  before do
   sleep 0.1
    seller = FactoryBot.create(:user)
    item = FactoryBot.create(:item, user_id: seller.id)
    buyer = FactoryBot.create(:user)
    @buy = FactoryBot.build(:buy, user_id: buyer.id, item_id: item.id)
  end
  
  describe '商品購入' do
    context '商品購入が上手くいく時' do
      it "postcodeとshipping_place_idとcityとblockとphoneが存在すれば登録できる" do
        expect(@buy).to be_valid

      end
    end

     context '購入がうまくいかないとき' do
       it "postcodeが空だと登録できない" do
         @buy.postcode = nil
         @buy.valid? 
       expect(@buy.errors.full_messages).to include("Postcode can't be blank")
     end   

       it "shipping_place_idが空だと登録できない" do
         @buy.shipping_place_id = nil
         @buy.valid?
       expect(@buy.errors.full_messages).to include("Shipping place can't be blank")
       end

       it "cityが空だと登録できない" do
         @buy.city = nil
         @buy.valid? 
       expect(@buy.errors.full_messages).to include("City can't be blank")
       end

       it "blockが空だと登録できない" do
         @buy.block = nil
         @buy.valid? 
       expect(@buy.errors.full_messages).to include("Block can't be blank")
       end

       it "phoneが空だと登録できない" do
         @buy.phone = nil
         @buy.valid? 
       expect(@buy.errors.full_messages).to include("Phone can't be blank")
       end   

       it "postcodeにハイフンがないと登録できない" do
         @buy.postcode = "0000000"
         @buy.valid?
       expect(@buy.errors.full_messages).to include("Postcode can't be blank")
       end

       it "phoneにハイフンがあると登録できない" do
         @buy.phone = "000-00000000"
         @buy.valid? 
       expect(@buy.errors.full_messages).to include("Phone is not a number")
       end

       it "phoneが12桁以上だと登録できない" do
        @buy.phone = "000-0000-00000"
        @buy.valid? 
      expect(@buy.errors.full_messages).to include("Phone is not a number", "Phone is too long (maximum is 12 characters)")
      end   


       it "tokenが空だと登録できない" do
        @buy.token = nil
        @buy.valid? 
      expect(@buy.errors.full_messages).to include("Token can't be blank")
      end

     end
  end
end
