# == Schema Information
#
# Table name: taggings
#
#  id         :integer          not null, primary key
#  photo_id   :integer          not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tagging < ActiveRecord::Base
  validates :photo_id, :user_id, presence: true
  validates :photo_id, uniqueness: {scope: :user_id}

  belongs_to(
    :photo
  )

  belongs_to(
    :user
  )
end
