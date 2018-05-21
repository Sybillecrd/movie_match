class Movie < ApplicationRecord
  has_many :users, through: :opinions
end
