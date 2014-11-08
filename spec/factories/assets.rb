# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :asset do
    user_id 1
    uploaded_file "image.jpg"
  end
end
