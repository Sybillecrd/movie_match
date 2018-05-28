# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/movie_release

  def movie_release
    UserMailer.movie_release(User.first, Movie.first).deliver_now
  end

end
