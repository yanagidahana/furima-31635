class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

     with_options presence: true do
         validates :nickname
         validates :email
         validates :encrypted_password
         validates :birthday
     end
     with_options presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/} do
         validates :last_name
         validates :first_name
     end    
    with_options presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/} do
         validates :last_name_kana
         validates :first_name_kana
    end    
end
