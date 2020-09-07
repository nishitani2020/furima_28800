class Order < ApplicationRecord
  belongs_to :purchase

  validates :postal_code, :prefecture_id, :city, :address, :phone_number, :purchase
end
