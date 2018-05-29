class My::MoviesController < ApplicationController
  def index
    # get user_id
    # if user opinion: true => get movie_id
    @movies = Movie.joins(:opinions).where(opinions: {value: true, user_id: current_user, seen: false}).merge(Opinion.order(created_at: :desc))
   # @tmdb_ids = @movies[0]['tmdb_id']
  end

  def seen_index
    @movies = Movie.joins(:opinions).where(opinions: {value: true, user_id: current_user, seen: true}).merge(Opinion.order(created_at: :desc))
  end

  def show
    @movie = Movie.find(params[:id])
    @opinion = Opinion.find_by(movie_id: @movie[:id])
    @movie_tmdb = TMDB::Movie.details(@movie.tmdb_id)
  end

end
