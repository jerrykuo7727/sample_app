require 'test_helper'

class UserMailerTest < ActionMailer::TestCase

  test "account_activation" do
    user = users(:michael)
    user.activation_token = User.new_token
    mail = UserMailer.account_activation(user)
    assert_equal "樣品App帳號驗證信", mail.subject
    assert_equal [user.email], mail.to
    assert_equal ["noreply@example.com"], mail.from
    assert_match user.name,               mail.html_part.body.raw_source
    assert_match user.activation_token,   mail.html_part.body.raw_source
    assert_match CGI.escape(user.email),  mail.html_part.body.raw_source
    assert_match user.name,               mail.text_part.body.raw_source
    assert_match user.activation_token,   mail.text_part.body.raw_source
    assert_match CGI.escape(user.email),  mail.text_part.body.raw_source
  end

  test "password_reset" do
    user = users(:michael)
    user.reset_token = User.new_token
    mail = UserMailer.password_reset(user)
    assert_equal "樣品App密碼重置信", mail.subject
    assert_equal [user.email], mail.to
    assert_equal ["noreply@example.com"], mail.from
    assert_match user.reset_token,        mail.html_part.body.raw_source
    assert_match CGI.escape(user.email),  mail.html_part.body.raw_source
    assert_match user.reset_token,        mail.text_part.body.raw_source
    assert_match CGI.escape(user.email),  mail.text_part.body.raw_source
  end
end
