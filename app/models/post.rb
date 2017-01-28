# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  author_id  :integer          not null
#  wall_id    :integer          not null
#  body       :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ActiveRecord::Base
  validates :author_id, :wall_id, :body, presence: true

  has_many(
    :shares
  )

  belongs_to(
    :author,
    class_name: :User,
    foreign_key: :author_id
  )

  belongs_to(
    :wall,
    class_name: :User,
    foreign_key: :wall_id
  )

  has_many(
    :comments,
    class_name: :PostComment,
    foreign_key: :post_id
  )

  has_many(
    :likes,
    class_name: :PostLike,
    foreign_key: :post_id
  )

  has_many(
    :likers,
    through: :likes,
    source: :user
  )
end
