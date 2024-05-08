user1 = User.create(email: 'test1@test.com', name: 'test1', password: 'password', password_confirmation: 'password')
user2 = User.create(email: 'test2@test.com', name: 'test2', password: 'password', password_confirmation: 'password')

3.times do |i|
  post1 = Post.create(title: "Title #{i}", body: "Body #{i} words goes here idk...", user_id: user1.id)
  post2 = Post.create(title: "Title #{i}", body: "Body #{i} words goes here idk...", user_id: user2.id)

  3.times do |_j|
    Comment.create(post_id: post1.id, user_id: user2.id, body: "Comment body for Post #{post1.id} by User #{user2.id}")
    Comment.create(post_id: post2.id, user_id: user1.id, body: "Comment body for Post #{post2.id} by User #{user1.id}")
  end
end

if Rails.env.development?
  AdminUser.create!(email: 'admin@example.com', password: 'password',
                    password_confirmation: 'password')
end
