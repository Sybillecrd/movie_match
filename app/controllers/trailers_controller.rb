

class TrailersController < ApplicationController
  def index
    # aller chercher les genres dans les cookies
    discover_options = {}
    discover_options[:genre_ids] = JSON.parse(cookies[:genre_ids]) if cookies[:genre_ids].present?
    discover_options[:moment] = cookies[:moment]

    @trailers = TMDB::Discover.movie(discover_options)
    session[:selected_trailers] = @trailers.map { |trailer| trailer['id'] }
    session[:page] = 1

    if @trailers.any?
      @trailer = TMDB::Movie.details(@trailers.first['id'])
    end
  end
end
