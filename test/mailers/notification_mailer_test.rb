require 'test_helper'

class NotificationMailerTest < ActionMailer::TestCase
  test "send_when_get_answer" do
    mail = NotificationMailer.send_when_get_answer
    assert_equal "Send when get answer", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
