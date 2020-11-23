class Item < ApplicationRecord

  belongs_to :user
  has_one_attached :image
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
  validates :category_id, numericality: { other_than: 0 } 
  validates :status_id, numericality: { other_than: 0 } 
  validates :shipping_id, numericality: { other_than: 0 } 
  validates :shipping_place_id, numericality: { other_than: 0 } 
  validates :date_shipment_id, numericality: { other_than: 0 } 

  validates :price, numericality: {with: /\A[０-９]+\z/, message: "Price Half-width number"}

end

