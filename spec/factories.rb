FactoryGirl.define do
  factory :user do
    email "user@gmail.com"
    password "testing123"
    password_confirmation "testing123"
  end
end
