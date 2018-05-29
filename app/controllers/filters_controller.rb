class FiltersController < ApplicationController
  def new
    @genres = Genre.all

    Struct.new("Moment", :slug, :label)
    @moments = [
      Struct::Moment.new(:home, "To watch at home"),
      Struct::Moment.new(:theater, "Now in theaters"),
      Struct::Moment.new(:upcoming, "Upcoming")
    ]

    @selected_genre_ids = JSON.parse(cookies[:genre_ids]) if cookies[:genre_ids].present?
    @selected_moment = cookies[:moment] if cookies[:moment].present?
  end

  def create
    cookies[:genre_ids] = JSON.generate(params[:filter][:genre_ids].reject { |g| g.blank? })
    cookies[:moment] = params[:filter][:moment]
    redirect_to trailers_path
  end
end
