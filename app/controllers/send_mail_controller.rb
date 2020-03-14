class SendMailController < ApplicationController
  def send_recommend
    user = '紹介者'
    title = 'タイトル'
    email = 'a@a.com'
    BookMailer.with(user: user, title: title, email: email).send_recommend.deliver_now
  end
end
