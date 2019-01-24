class Address < ApplicationRecord
  belongs_to :user

  include JpPrefecture
  jp_prefecture :prefecture, method_name: :prefecture

end
