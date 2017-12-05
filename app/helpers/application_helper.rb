module ApplicationHelper
  def liked?(user, post)
    user.likes.find_by(post_id: post.id)
  end
end
