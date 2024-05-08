ActiveAdmin.register Comment, as: 'Post_Comment' do
  permit_params :post_id, :user_id, :body  # Add :body to the permitted parameters

  filter :post_id_cont, label: 'Post ID'
  filter :user_id_cont, label: 'User ID'

  index do
    selectable_column
    id_column
    column :post_id do |comment|
      link_to comment.post.title, admin_post_path(comment.post)
    end
    column :user_id do |comment|
      link_to comment.user.name, admin_user_path(comment.user)
    end
    column 'Body' do |comment|
      strip_tags(comment.body.to_plain_text)
    end
    actions
  end

  form do |f|
    f.inputs do
      f.input :user_id
      f.input :post_id
      f.input :body
    end
    f.actions
  end
end
