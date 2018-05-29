class SeenMoviesController < ApplicationController
  def create
    @opinion = Opinion.find_by(user_id: current_user, movie_id: params["movie_id"])
    @opinion.seen = true
    @opinion.save!
    redirect_to my_movie_path(params["movie_id"])
  end
end
