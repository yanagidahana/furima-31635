class Item < ApplicationRecord

  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash: category
  belongs_to_active_hash: status
  belongs_to_active_hash: shipping
  belongs_to_active_hash: shipping_place
  belongs_to_active_hash: date_shipment

end

#private
  #def message_params
   # params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  #end