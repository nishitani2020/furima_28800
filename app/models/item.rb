class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category 
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_cost
  belongs_to_active_hash :delivery_area
  belongs_to_active_hash :delivery_day
  belongs_to :user

  validates :image, :name, :explanation, :price, presence: true

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :delivery_cost_id
    validates :delivery_area_id
    validates :delivery_day_id
  end
end