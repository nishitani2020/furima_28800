FactoryBot.define do
  factory :purchase_order do
    postal_code { '222-2222' }
    delivery_area_id { '2' }
    city { '大阪' }
    address { '22' }
    building_name { '大阪' }
    phone_number { '09012345678' }
    token { 'abcdefg' }
  end
end
