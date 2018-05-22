module TMDB
  class Movie
    def self.details(tmdb_id)
      movie_url = "https://api.themoviedb.org/3/movie/#{tmdb_id}?api_key=#{ENV['TMDB_KEY']}&append_to_response=videos"
      puts "=" * 20
      puts movie_url
      puts "=" * 20
      movie_data = RestClient.get(movie_url, headers={})
      return JSON.parse movie_data
    end
  end
end
