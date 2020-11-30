class Item < ApplicationRecord

  belongs_to :user
  has_one_attached :image
  has_one :record

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping
  belongs_to_active_hash :shipping_place
  belongs_to_active_hash :date_shipment


  #空の投稿を保存できないようにする
  validates :image, :name, :explanation, :price, :user, presence: true

  validates :price, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

  #空の投稿を保存できないようにする
  with_options presence: true do
    with_options numericality: { other_than: 0, message: "can't be blank"}  do
      validates :category_id
      validates :status_id
      validates :shipping_id
      validates :shipping_place_id
      validates :date_shipment_id 
    end
  end  
validates :price, numericality: {with: /\A[０-９]+\z/, message: "Price Half-width number"}

end
