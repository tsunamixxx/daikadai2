class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_blog.subject
  #
  def sendmail_blog(picture)
    @picture = picture

    mail to: "tsunami0108@gmail.com",
    subject: '写真が投稿されました'
  end
end
