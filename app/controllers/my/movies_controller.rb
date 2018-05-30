require 'allocine'

class My::MoviesController < ApplicationController
  def index
    # get user_id
    # if user opinion: true => get movie_id
    @movies = Movie.joins(:opinions).where(opinions: {value: true, user_id: current_user, seen: false}).merge(Opinion.order(created_at: :desc))
    @seen_movies = Movie.joins(:opinions).where(opinions: {value: true, user_id: current_user, seen: true}).merge(Opinion.order(created_at: :desc))
   # @tmdb_ids = @movies[0]['tmdb_id']
  end

  def show
    @movie = Movie.find(params[:id])
    @opinion = Opinion.find_by(movie_id: @movie[:id])
    @movie_tmdb = TMDB::Movie.details(@movie.tmdb_id)

    if @movie.status == "In theaters"
      allocine = Allocine.new
      allocine_movie_raw = allocine.api(:search, {q: @movie['title']})
      @allocine_movie_parsed = JSON.parse allocine_movie_raw
      if @allocine_movie_parsed["feed"]["movie"] != nil
        allocine_movie_code = @allocine_movie_parsed["feed"]["movie"][0]["code"]

        theaters_showtimes_raw = allocine.api(:showtimelist, {movie: allocine_movie_code, lat: '49.451827', long: '1.101424', radius: '20', date: Date.today.strftime("%Y-%m-%d") })
        @theaters_showtimes_parsed = JSON.parse theaters_showtimes_raw
        if @theaters_showtimes_parsed["feed"]["totalResults"] != 0
          @theaters_showtimes = @theaters_showtimes_parsed['feed']["theaterShowtimes"].first(3)
        end
      end
    end

  end

end
