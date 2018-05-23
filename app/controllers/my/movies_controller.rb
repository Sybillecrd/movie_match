class My::MoviesController < ApplicationController
  def index
    # get user_id
    # if user opinion: true => get movie_id
   @movies = Movie.joins(:opinions).where(opinions: {value: true, user_id: current_user})
   @tmdb_ids = @movies[0]['tmdb_id']
  end
end
