ActiveAdmin.register Post do
  permit_params :title, :body, :comment, :published_at, :user_id

  scope :all
  scope :published
  scope :unpublished

  filter :title_cont, label: 'Title' # Add a filter for the name attribute
  filter :body_cont, label: 'Body' # Add a filter for the email attribute
  filter :published_at, label: 'Published_at'
  # filter :user_id, with: 'user_id'

  index do
    selectable_column
    id_column
    column :title
    column :body

    actions
  end

  form do |f|
    f.inputs do
      f.input :user
      f.input :title
      f.input :body
    end
    f.actions
  end

  action_item :publish, only: :show do
    link_to 'Publish', publish_admin_post_path(post), method: :put unless post.published_at?
  end

  action_item :unpublish, only: :show do
    link_to 'Unpublish', unpublish_admin_post_path(post), method: :put if post.published_at?
  end

  member_action :publish, method: :put do
    post = Post.find(params[:id])
    post.update(published_at: Time.zone.now)
    redirect_to admin_post_path(post)
  end

  member_action :unpublish, method: :put do
    post = Post.find(params[:id])
    post.update(published_at: nil)
    redirect_to admin_post_path(post)
  end
end
