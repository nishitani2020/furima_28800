FactoryBot.define do
  factory :item do
    name { 'name' }
    explanation { 'ああああ' }
    category_id { '2' }
    status_id { '2' }
    delivery_cost_id { '2' }
    delivery_area_id { '2' }
    delivery_day_id { '2' }
    price { '500' }
    association :user
  end
end
