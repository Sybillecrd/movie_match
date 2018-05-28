class Movie < ApplicationRecord
  has_many :opinions
  has_many :users, through: :opinions

  def release_year
    Date.parse(self.release_date).year
  end

  def released?
    DateTime.now >= release_date
  end
end
