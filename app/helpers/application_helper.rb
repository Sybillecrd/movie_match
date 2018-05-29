module ApplicationHelper

  def tmdb_image_tag(image, options = {})
    image_tag tmdb_image_path(image), options
  end

  def tmdb_image_path(image)
    if image.present?
      "https://image.tmdb.org/t/p/w500" + image
    else
      "default_photo.png"
    end
  end

end
