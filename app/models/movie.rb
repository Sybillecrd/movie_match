class Movie < ApplicationRecord
  has_many :opinions
  has_many :users, through: :opinions

  def release_year
    Date.parse(self.release_date).year
  end

  def released?
    DateTime.now >= release_date
  end

  def status
    if release_date < (DateTime.now - 30).to_s("yyyyMMdd").first(10)
      return "Classic"
    elsif release_date > (DateTime.now + 1).to_s("yyyyMMdd").first(10)
      return "Upcoming"
    elsif release_date >= (DateTime.now - 30).to_s("yyyyMMdd").first(10) && release_date < (DateTime.now).to_s("yyyyMMdd").first(10)
      return "In theaters"
    else
      return ""
    end
  end
end
