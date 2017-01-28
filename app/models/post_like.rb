# == Schema Information
#
# Table name: post_likes
#
#  id         :integer          not null, primary key
#  post_id    :integer          not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PostLike < ActiveRecord::Base
  validates :post_id, :user_id, presence: true
  validates :post_id, uniqueness: {scope: :user_id}

  belongs_to(
    :post
  )

  belongs_to(
    :user
  )
end
