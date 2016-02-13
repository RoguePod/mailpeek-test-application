FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "email-#{n}@example.com"
    end

    password 'test11'
    password_confirmation 'test11'
  end
end
