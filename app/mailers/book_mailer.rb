class BookMailer < ApplicationMailer
  default from: 'book@example.com'
  def send_recommend
    # メール本文
    @user = params[:user]
    @title = params[:title]
    @email = params[:email]

    mail(to: @email, subject: 'オススメの本が届きました')
  end
end
