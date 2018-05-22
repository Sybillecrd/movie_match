require 'tmdb/tmdb'

class TrailersController < ApplicationController
  def index
    # aller chercher les genres dans les cookies
    @movies = TMDB::Discover.movie({ genre_ids: [28, 80, 18] })
    @movies[0] = TMDB::Movie.details(@movies.first['id'])

  end
end
