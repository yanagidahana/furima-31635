class User < ApplicationRecord

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

     with_options presence: true do
         validates :nickname
         validates :email
         validates :password
         validates :birthday
     end
     with_options presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/} do
         validates :last_name
         validates :first_name
     end    
    with_options presence: true, format: {with: /\A[ァ-ヶー－]+\z/} do
         validates :last_name_kana
         validates :first_name_kana
    end    
           VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[\d])\w{6,12}\z/
           validates :password, presence: true,
            format: { with: VALID_PASSWORD_REGEX,
             message: "は半角6~12文字英大文字・小文字・数字それぞれ１文字以上含む必要があります"}


    has_many :items, dependent: :destroy
    has_many :records

end

