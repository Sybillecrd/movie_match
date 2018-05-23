class OpinionsController < ApplicationController

  # def new
  #   @opinion = Opinion.new
  # end

  def create

    @opinion = Opinion.new(params_opinion)
    @opinion.save

  end

  private

  def params_opinion
      params.require(:opinion).permit(:value, :tmdb_id, :next_tmdb_id )
  end

end
