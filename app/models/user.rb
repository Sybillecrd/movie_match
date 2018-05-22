class User < ApplicationRecord
  has_many :opinions
  has_many :movies, through: :opinions

  validates :first_name, presence: true
  validates :address, presence: true
  validates :email, presence: true
end
