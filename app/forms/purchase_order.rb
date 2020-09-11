class PurchaseOrder

  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :delivery_area_id, :city, :address, :building_name, :phone_number, :token

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :city
    validates :address
    validates :phone_number, format: {with: /\A[0-9]+\z/}, length: { maximum: 11 }
    validates :token
  end

    validates :delivery_area_id, numericality: { other_than: 1 }

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Order.create(postal_code: postal_code, delivery_area_id: delivery_area_id, city: city, address: address, phone_number: phone_number, purchase_id: purchase.id )
  end
end