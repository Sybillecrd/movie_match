module ApplicationHelper

  def tmdb_image_tag(image, options = {})
    if image.present?
      image_tag "https://image.tmdb.org/t/p/w500" + image, options
    else
      image_tag "default_photo.png", options
    end
  end

end
