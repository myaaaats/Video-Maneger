class PostMailer < ApplicationMailer
  def post_mail(contact)
    @contact = contact

    mail to: @contact.user.email, subject: "Youtube Creater's 動画投稿確認メール"
  end
end
