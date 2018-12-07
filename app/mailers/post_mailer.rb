class PostMailer < ApplicationMailer
  def post_mail(post)
    @post = post
    mail to: @post.user.email, subject: "投稿完了通知"
  end
end
