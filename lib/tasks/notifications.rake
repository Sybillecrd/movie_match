namespace :notifications do
  desc "Send an email to the the users who asked for it one day bedore the movie is released."
  task movie_release_mail: :environment do
    Movie.all.each do |movie|
      if movie.release_date == (DateTime.now + 1).to_s("yyyyMMdd").first(10)
        movie.users.each do |user|
          if user.opinions.find_by(movie_id: movie.id).release_mail
            UserMailer.movie_release(user, movie)
          end
        end
      end
    end
  end

end
