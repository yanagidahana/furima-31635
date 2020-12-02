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
      expect(@item.errors.full_messages).to include("画像を入力してください")
      end   
      it "nameが空だと登録できない" do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("ニックネームを入力してください")
      end   
      it "explanationが空だと登録できない" do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end   
      it "priceが空だと登録できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("価格を入力してください", "価格は数値で入力してください", "価格は半角数字で入力して下さい")
      end 
      it "priceが299以下であれば登録できない" do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は300以上の値にしてください")
      end   
      it "priceが¥10000000以上であれば登録できない" do
        @item.price = 1000000000000
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は9999999以下の値にしてください")
      end   
      it "priceが半角数字でなければ登録できない" do
        @item.price = '５００'
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は数値で入力してください", "価格は半角数字で入力して下さい")
      end  
      it "categoryが0では登録できない" do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを入力して下さい")
      end  
      it "statusが0では登録できない" do
        @item.status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を入力して下さい")
      end  
      it "shippingが0では登録できない" do
        @item.shipping_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("発送料の負担を入力して下さい")
      end  
      it "shipping_placeが0では登録できない" do
        @item.shipping_place_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を入力して下さい")
      end  
      it "date_shipmentが0では登録できない" do
        @item.date_shipment_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を入力して下さい")
      end  
   end     
  end
end  

