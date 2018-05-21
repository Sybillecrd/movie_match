class User < ApplicationRecord
  has_many :movies, through: :opinions
end
