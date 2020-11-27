class Buy
  include ActiveModel::Model
  attr_accessor :postcode, :shipping_place_id, :city, :block, :building, :phone,:user_id, :item_id

  # ここにバリデーションの処理を書く
  validates :postcode, :shipping_place_id, :city, :block, :phone, presence: true


  def save
    # 各テーブルにデータを保存する処理を書く
    record = Record.create(user_id: user_id, item_id: item_id)
    Area.create(postcode: postcode,  shipping_place_id: shipping_place_id, city: city, block: block, building: building, phone: phone)
  end
end


