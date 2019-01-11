FactoryBot.define do

  factory :user do
    nickname                      {"aaa"}
    email                         {"aaa@gmail.com"}
    password                      {"aaaaaa"}
    password_confirmation         {"aaaaaa"}
    phone_number                  {"08012345678"}
    birth_year                    {"2000"}
    birth_month                   {"1"}
    birth_day                     {"1"}
    first_name                    {"bbb"}
    last_name                     {"ccc"}
    first_name_kana               {"あああ"}
    last_name_kana                {"いいい"}
  end
end
