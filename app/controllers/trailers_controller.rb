

class TrailersController < ApplicationController
  def index
    # aller chercher les genres dans les cookies
    discover_options = {}
    discover_options[:genre_ids] = JSON.parse(cookies[:genre_ids]) if cookies[:genre_ids].present?
    discover_options[:moment] = cookies[:moment]

    if TMDB::Discover.movie(discover_options).empty?
      @movies = TMDB::Discover.movie(discover_options)
    else
      @movies = TMDB::Discover.movie(discover_options)
      @movies[0] = TMDB::Movie.details(@movies.first['id'])
      @movie = @movies[0]
    end
  end
end
