module ApplicationHelper

  def tmdb_image_tag(image, options = {})
    if image.present?
      image_tag "https://image.tmdb.org/t/p/w500" + image, options
    else
      image_tag "http://a1.res.cloudinary.com/wlabs/image/asset/f_auto/placeholder-movie-f515675f5205c172cc9562cd133c6832.png", options
    end
  end

end
