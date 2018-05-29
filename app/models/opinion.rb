class Opinion < ApplicationRecord
  belongs_to :movie
  belongs_to :user

  def seen?
    seen == true
  end
end
