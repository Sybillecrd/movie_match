require 'tmdb/tmdb'

class OpinionsController < ApplicationController

  # def new
  #   @opinion = Opinion.new
  # end

  def create
    @movie = Movie.find_or_create_by(tmdb_id: params_taste["tmdb_id"]) do |movie|
      movie_info = TMDB::Movie.details(movie[:tmdb_id])
      movie.title = movie_info["title"]
      movie.poster = movie_info["poster_path"]
      movie.release_date = movie_info["release_date"]
    end
    @opinion = Opinion.new(movie_id: @movie.id, user_id: current_user.id, value: params_taste["value"])
    @next_movie = TMDB::Movie.details(params_taste["next_tmdb_id"])
    @opinion.save
    respond_to do |format|
      format.js
    end
  end

  private

  def params_taste
    params.require(:opinion).permit(:value, :tmdb_id, :next_tmdb_id )
  end

end
