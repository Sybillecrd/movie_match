class UserMailer < ApplicationMailer
  default from: "sybillecordeau@gmail.com"
  layout "mailer"

  def movie_release(user, movie)
    @user = user
    @movie = movie

    mail(to: @user.email, subject: "Movie is coming")
  end

end
