module TMDB
  class Discover
    def self.movie(options = {})
      page = options[:page] || 1

      genres_options = options[:genre_ids].present? ? "&with_genres=#{options[:genre_ids].join(",")}" : ""

      if options[:moment].include?("home")
        search_date = (DateTime.now - 30).to_s("yyyyMMdd").first(10)
        option_moment = "&primary_release_date.lte=#{search_date}"
      elsif options[:moment].include?("Upcoming")
        search_date = (DateTime.now + 1).to_s("yyyyMMdd").first(10)
        option_moment = "&primary_release_date.gte=#{search_date}"
      elsif options[:moment].include?("theaters")
        starting_date = (DateTime.now - 30).to_s("yyyyMMdd").first(10)
        ending_date = (DateTime.now).to_s("yyyyMMdd").first(10)
        option_moment = "&primary_release_date.gte=#{starting_date}&primary_release_date.lte=#{ending_date}"
      else
        option_moment = ""
      end

      url = "https://api.themoviedb.org/3/discover/movie?api_key=#{ENV['TMDB_KEY']}&language=fr-FR&region=FR#{option_moment}#{genres_options}&sort_by=popularity.desc&include_adult=false&include_video=false&page=#{page}"
      api_data = RestClient.get(url)
      datas = JSON.parse(api_data)
      movies = datas['results']
      return movies
    end
  end
end
