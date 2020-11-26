class Buy
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :city, :block, :building, :phone, :record

  # ここにバリデーションの処理を書く
  validates :postcode, :prefecture_id, :city, :block, :phone,  presence: true

  def save
    # 各テーブルにデータを保存する処理を書く
    record = Records.create(user: user, item: item)
    areas.create(postcode: postcode, prefecture_id: prefecture_id, city: city, block: block, building: building, phone: phone, record: record, record_id: record.id)
  end
end