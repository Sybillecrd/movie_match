class My::MoviesController < ApplicationController
  def index
    # get user_id
    # if user opinion: true => get movie_id
   @movies = Movie.joins(:opinions).where(opinions: {value: true, user_id: current_user})
   # @tmdb_ids = @movies[0]['tmdb_id']
  end

  def show
    @movie_mailer = Movie.find(params[:id])
    @opinion_mailer = Opinion.find_by(movie_id: @movie_mailer[:id])
    @movie = TMDB::Movie.details(@movie_mailer.tmdb_id)
  end

end
