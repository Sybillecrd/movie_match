require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "movie_release" do
    mail = UserMailer.movie_release
    assert_equal "Movie release", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
