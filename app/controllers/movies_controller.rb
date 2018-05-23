class MoviesController < ApplicationController


  def create
    @movie = Movie.new(movie_params)
    if Movie.save
      redirect_to trailers_path
    else
      render trailers_path
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:tmdb_id, :title, :poster, :release_date)
  end

end
