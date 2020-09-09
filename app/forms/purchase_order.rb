class PurchaseOrder

  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :delivery_area_id, :city, :address, :building_name, :phone_number, :token

  validates :postal_code, :delivery_area_id, :city, :address, :phone_number, presence: true

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Order.create(postal_code: postal_code, delivery_area_id: delivery_area_id, city: city, address: address, phone_number: phone_number, purchase_id: purchase.id )
  end
end