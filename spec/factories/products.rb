FactoryGirl.define do
  factory :product do
    name "Bicicleta"
    price "20.99"
    released_at Time.now
    category_id 1
  end
end