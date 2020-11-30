class Buy
  include ActiveModel::Model
  attr_accessor :postcode, :shipping_place_id, :city, :block, :building, :phone,:user_id, :item_id,:token

  # ここにバリデーションの処理を書く
  validates :postcode, :shipping_place_id, :city, :block, :phone,  :token, presence: true
  validates :postcode, format: { with: /\A\d{3}[-]\d{4}\z/, message: "can't be blank" }
  validates :phone, numericality: true
  validates :phone, length: {maximum: 12}
  validates :shipping_place_id, numericality: {other_than: 0, message: "can't be blank" }




  def save
    # 各テーブルにデータを保存する処理を書く
    record = Record.create(user_id: user_id, item_id: item_id)
    Area.create(postcode: postcode,  shipping_place_id: shipping_place_id, city: city, block: block, building: building, phone: phone, record_id:record.id)
  end
end


