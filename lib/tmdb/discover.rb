module TMDB
  class Discover
    def self.movie(options = {})
      genres_options = options[:genre_ids].present? ? "&with_genres=#{options[:genre_ids].join(",")}" : ""
      url = "https://api.themoviedb.org/3/discover/movie?api_key=#{ENV['TMDB_KEY']}&language=en-US#{genres_options}&sort_by=popularity.desc&include_adult=false&include_video=false&page=1"
      puts "=" * 20
      puts url
      puts "=" * 20
      api_data = RestClient.get(url)
      datas = JSON.parse(api_data)
      movies = datas['results']
      return movies
    end
  end
end
