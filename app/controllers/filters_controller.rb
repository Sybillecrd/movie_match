class FiltersController < ApplicationController
  def new
    @genres = Genre.all
    @moments = ["Find a movie to watch at home now", "Find a movie now playing in theaters", "Be aware of the great movies upcoming"]
  end

  def create
    cookies[:genre_ids] = JSON.generate(params[:filter][:genre_ids].reject { |g| g.blank? })
    cookies[:moment] = params[:filter][:moment]
    redirect_to trailers_path
  end
end
