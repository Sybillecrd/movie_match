class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :opinions
  has_many :movies, through: :opinions

  validates :first_name, presence: true
  validates :last_name, presence: true
end
