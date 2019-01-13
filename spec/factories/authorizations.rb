FactoryBot.define do
  factory :authorization do
    email        {"rspec_test@gmail.com"}
    uid          {"123456789"}
    provider     {"facebook"}
    username     {"aaa"}
    confirmed_at {Time.now}
  end
end
