class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post

  def create
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user

    if curse_word_found?(@comment.body.to_plain_text)
      flash[:alert] = 'Your comment contains inappropriate language and cannot be saved.'
      redirect_to post_path(@post)
    elsif @comment.save
      flash[:notice] = 'Comment has been created.'
      redirect_to post_path(@post)
    else
      flash[:alert] = 'Comment could not be created.'
      redirect_to post_path(@post)
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  def update
    @comment = @post.comments.find(params[:id])

    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to post_url(@post), notice: 'Comment has been updated!' }
      else
        format.html { redirect_to post_url(@post), alert: 'Comment was not updated!' }
      end
    end
  end

  def no_curse_words
    plain_text_body = body.to_plain_text if body.present?
    return unless plain_text_body.present? && curse_word_found?(plain_text_body)

    errors.add(:base, 'Your comment contains inappropriate language and cannot be saved.')
  end

  def curse_word_found?(text)
    CURSE_WORDS.any? { |word| text.match?(Regexp.new(word, Regexp::IGNORECASE)) }
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
