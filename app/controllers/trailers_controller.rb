class TrailersController < ApplicationController
  def index
    url = 'https://api.themoviedb.org/3/discover/movie?api_key=e8428c4eb8e20209b6df50ec328a5fed&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1'
    api_data = RestClient.get(url, headers={})
    datas = JSON.parse(api_data)
    @movies = datas['results']

  end
end
