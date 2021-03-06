require 'tmdb/tmdb'
require 'allocine'

class OpinionsController < ApplicationController

  def create
    @movie = Movie.find_or_create_by(tmdb_id: params_taste["tmdb_id"]) do |movie|
      movie_info = TMDB::Movie.details(movie[:tmdb_id])
      movie.title = movie_info["title"]
      movie.poster = movie_info["poster_path"].to_s
      movie.release_date = movie_info["release_date"]
    end
    @opinion = Opinion.create(movie_id: @movie.id, user_id: current_user.id, value: params_taste["value"])


    if @movie.status == "In theaters"
      allocine = Allocine.new
      allocine_movie_raw = allocine.api(:search, {q: @movie['title']})
      @allocine_movie_parsed = JSON.parse allocine_movie_raw
      if @allocine_movie_parsed["feed"]["movie"] != nil
        allocine_movie_code = @allocine_movie_parsed["feed"]["movie"][0]["code"]

        if cookies[:gps] != nil
          lat_lng = cookies[:gps].split("|")

          theaters_showtimes_raw = allocine.api(:showtimelist, {movie: allocine_movie_code, lat: lat_lng[0], long: lat_lng[1], radius: '20', date: Date.today.strftime("%Y-%m-%d") })
          @theaters_showtimes_parsed = JSON.parse theaters_showtimes_raw
          if @theaters_showtimes_parsed["feed"]["totalResults"] != 0
            @theaters_showtimes = @theaters_showtimes_parsed['feed']["theaterShowtimes"].first(3)
          end
        end
      end
    end


    current_tmdb_id_index = session[:selected_trailers].index(params[:opinion][:tmdb_id].to_i)
    next_tmdb_id_index = current_tmdb_id_index

    if current_tmdb_id_index == session[:selected_trailers].size - 1
      discover_options = {}
      discover_options[:genre_ids] = JSON.parse(cookies[:genre_ids]) if cookies[:genre_ids].present?
      discover_options[:moment] = cookies[:moment]
      session[:page] += 1
      discover_options[:page] = session[:page]
      trailers = TMDB::Discover.movie(discover_options)
      session[:selected_trailers] = trailers.map { |trailer| trailer['id'] }
      next_tmdb_id_index = -1
    end

    youtube_id = nil

    while youtube_id.nil?
      next_tmdb_id_index += 1
      next_tmdb_id = session[:selected_trailers][next_tmdb_id_index]
      if next_tmdb_id.nil?
        @next_trailer = nil
        break
      end

      current_user_tmdb_ids = []
      current_user.movies.each do |movie|
          current_user_tmdb_ids << movie.tmdb_id
      end

      while current_user_tmdb_ids.include?(next_tmdb_id)
        next_tmdb_id_index += 1
        next_tmdb_id = session[:selected_trailers][next_tmdb_id_index]
        if next_tmdb_id.nil?
          @next_trailer = nil
          break
        end
      end
      @next_trailer = TMDB::Movie.details(next_tmdb_id)
      youtube_id = true if @next_trailer.dig('videos', 'results').try(:first).try(:dig, 'key')
      puts "=" * 20
      puts @next_trailer.dig('videos', 'results').try(:first).try(:dig, 'key')
    end

    respond_to do |format|
      format.js
    end
  end

  private

  def params_taste
    params.require(:opinion).permit(:value, :tmdb_id, :next_tmdb_id)
  end

end
