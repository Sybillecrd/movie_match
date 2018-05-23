class PagesController < ApplicationController
   skip_before_action :authenticate_user!, only: :new

  def home
  end
end
