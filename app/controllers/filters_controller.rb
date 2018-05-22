class FiltersController < ApplicationController
  def new
    @genres = Genre.all
    @moments = ["Now", "Cinema", "Later"]
  end

  def create
    cookies[:genre_ids] = JSON.generate(params[:filter][:genre_ids].reject { |g| g.blank? })
    cookies[:moment] = params[:filter][:moment]
    redirect_to trailers_path
  end
end
