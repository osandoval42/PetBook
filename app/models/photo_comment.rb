# == Schema Information
#
# Table name: photo_comments
#
#  id         :integer          not null, primary key
#  photo_id   :integer          not null
#  user_id    :integer          not null
#  comment    :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PhotoComment < ActiveRecord::Base
  validates :photo_id, :user_id, :comment, presence: true

  belongs_to(
    :photo
  )

  belongs_to(
    :user
  )
end
