# == Schema Information
#
# Table name: shares
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  post_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Share < ActiveRecord::Base
  validates :user_id, :post_id, presence: true
  validates :user_id, uniqueness:{scope: :post_id}

  belongs_to(
    :user
  )

  belongs_to(
    :post
  )
end
