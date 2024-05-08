class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_rich_text :body
  after_create_commit :notify_recipient
  before_destroy :cleanup_notifications
  has_noticed_notifications model_name: 'Noticed::Event'
  has_many :notification_mentions, as: :record, dependent: :destroy, class_name: 'Noticed::Event'
  validate :no_curse_words

  def self.ransackable_attributes(_auth_object = nil)
    %w[user_id post_id] # Allow searching by user_id, title and body
  end

  def self.ransackable_associations(_auth_object = nil)
    [] # We don't have any searchable associations in this case
  end

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

  def no_curse_words
    plain_text_body = body.to_plain_text if body.present?
    return unless plain_text_body.present? && curse_word_found?(plain_text_body)

    errors.add(:base, 'Your comment contains inappropriate language and cannot be saved.')
  end

  def curse_word_found?(text)
    CURSE_WORDS.any? { |word| text.match?(Regexp.new(word, Regexp::IGNORECASE)) }
  end
end
