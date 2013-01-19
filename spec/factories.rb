FactoryGirl.define do
  factory :user do
    sequence(:username)  { |n| "Person_#{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}   
    password "password"
    password_confirmation "password"


  end

  factory :article do
    title "My article"
    content "Lorem ipsum"
    user
  end
end
