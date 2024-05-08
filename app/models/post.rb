class Post < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5, maximum: 50 }
  validates :body, presence: true # , length: { minimum: 10, maximum: 1000 }
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :notifications, through: :user, dependent: :destroy
  has_many :notification_mentions, through: :user, dependent: :destroy
  has_noticed_notifications model_name: 'Noticed::Notification'
  validate :no_curse_words

  scope :published, -> { where.not(published_at: nil) }
  scope :unpublished, -> { where(published_at: nil) }

  def self.ransackable_attributes(_auth_object = nil)
    %w[title body comments user] # Allow searching by title, body, comments  and user
  end

  def self.ransackable_associations(_auth_object = nil)
    [] # We don't have any searchable associations in this case
  end

  private

  def no_curse_words
    errors.add(:title, 'contains inappropriate language') if curse_word_found?(title)
    return unless body.present? && curse_word_found?(body.to_s)

    errors.add(:body, 'contains inappropriate language')
  end

  def curse_word_found?(text)
    CURSE_WORDS.any? { |word| text.match?(Regexp.new("\\b#{Regexp.escape(word)}\\b", Regexp::IGNORECASE)) }
  end
end
