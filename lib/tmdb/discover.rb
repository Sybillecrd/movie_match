module TMDB
  class Discover
    def self.movie(options = {})
      url = "https://api.themoviedb.org/3/discover/movie?api_key=#{ENV['TMDB_KEY']}&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1"
      api_data = RestClient.get(url)
      datas = JSON.parse(api_data)
      movies = datas['results']
      return movies
    end
  end
end
