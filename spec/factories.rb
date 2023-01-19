FactoryBot.define do
  factory :wallet do
    balance { 1.5 }
    user { nil }
  end

  factory :seller do
    phone { "MyString" }
    earnings { 1.5 }
    user { nil }
  end

  factory(:user) do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end
end
