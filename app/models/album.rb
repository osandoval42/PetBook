# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  title      :string           not null
#  caption    :text
#  date       :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Album < ActiveRecord::Base
  validates :user_id, :title, presence: true
  validates :user_id, uniqueness: {scope: :title}

  belongs_to(
    :user
  )

  has_many(
    :photos,
  )
end
