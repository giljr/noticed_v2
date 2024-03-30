# To deliver this notification:
#
# CommentNotifier.with(record: @post, message: "New post").deliver(User.all)

class CommentNotifier < ApplicationNotifier
  # Add your delivery methods
  #
  # deliver_by :email do |config|
  #   config.mailer = "UserMailer"
  #   config.method = "new_comment_email"
  # config.params = ->{ params }
  # config.args = ->{ [1, 2, 3] }
  # end

  #
  # bulk_deliver_by :slack do |config|
  #   config.url = -> { Rails.application.credentials.slack_webhook_url }
  # end
  #
  # deliver_by :custom do |config|
  #   config.class = "MyDeliveryMethod"
  # end

  # Add required params
  #
  # required_param :message
  # Define helper methods to make rendering easier.
  def message
    # test
    # @post = CommentNotifier.find(id).params[:post]
    # @user = User.find((CommentNotifier.find(id).params[:post].user_id))
    @post = record.post
    @user = record.user
    "#{@user.name} replied to #{@post.title.truncate(14)}"
  end

  # That allows us to do our url construction
  def url
    # test
    # post_path(CommentNotifier.find(id).params[:post].id)
    post_path(record.post.id)
  end
end
