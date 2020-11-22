require 'rails_helper'
describe Item do
  before do
    @Item = FactoryBot.build(:user)
  end

  describe '商品出品' do
    context '出品がうまくいくとき' do
      it "categoryとstatus、shippingとshipping_place、date_shipmentが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      context '新規登録がうまくいかないとき' do




