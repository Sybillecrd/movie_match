require 'tmdb/tmdb'


class TrailersController < ApplicationController
  def index
    # aller chercher les genres dans les cookies
    if cookies[:genre_ids].nil? && cookies[:moment].nil?
      redirect_to new_filter_path
    else

      discover_options = {}
      discover_options[:genre_ids] = JSON.parse(cookies[:genre_ids]) if cookies[:genre_ids].present?
      discover_options[:moment] = cookies[:moment]




      @trailers = TMDB::Discover.movie(discover_options)
      session[:selected_trailers] = @trailers.map { |trailer| trailer['id'] }
      session[:page] = 1

      if @trailers.any?

        current_tmdb_id_index = session[:selected_trailers].index(session[:selected_trailers].first)
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
      end
    end
  end
end
