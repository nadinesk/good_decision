FactoryGirl.define do
  factory :user do
    email "nadine@g.com"
    password_digest "password"
    username "nadine"
  end
end

user = create(:user)
user = build(:user)
