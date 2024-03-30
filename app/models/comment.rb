class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_rich_text :body
  after_create_commit :notify_recipient
  before_destroy :cleanup_notifications
  has_noticed_notifications model_name: 'Noticed::Event'
  has_many :notification_mentions, as: :record, dependent: :destroy, class_name: 'Noticed::Event'

  private

  def notify_recipient
    CommentNotifier.with(record: self, post:).deliver_later(post.user)
    # Using deliver_later will execute a background job when you hit 'post' for your comment.
    # This means that it won't stall the interface while the job is being processed.
    # You can simply post your comment and continue with your tasks, while in the background,
    # the Rails system takes care of delivering the comment in the background.
  end

  def cleanup_notifications
    post.notifications.where(id: post.id).destroy_all

    # post.notifications.count -> [3]
    # post.notifications.where(recipient_id: 1) - > #<ActiveRecord::AssociationRelation []>
    # same as in console: Notification.where(comment_id: :comment_id)
  end
end
