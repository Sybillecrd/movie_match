module TMDB
  class Discover
    def self.movie(options = {})
      url = "https://api.themoviedb.org/3/discover/movie?api_key=#{ENV['TMDB_KEY']}&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1"
      api_data = RestClient.get(url, headers={})
      datas = JSON.parse(api_data)
      @movies = datas['results']
      movie_url = "https://api.themoviedb.org/3/movie/#{@movies.first['id']}?api_key=#{ENV['TMDB_KEY']}&append_to_response=videos"
      datas_youtube = RestClient.get(movie_url, headers={})
      @movies[0] = JSON.parse datas_youtube
      return @movies
    end
  end
end
