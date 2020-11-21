class Item < ApplicationRecord

  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash: category
  belongs_to_active_hash: status
  belongs_to_active_hash: shipping
  belongs_to_active_hash: shipping_place
  belongs_to_active_hash: date_shipment

   presence: true

  #空の投稿を保存できないようにする
  validates :image, :name, :explanation, :price, :user, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }


  #空の投稿を保存できないようにする
  validates :category_id, numericality: { other_than: 0 } 
  validates :category_id, numericality: { other_than: 0 } 

end

/^[0-9a-zA-Z]*$/
9999999