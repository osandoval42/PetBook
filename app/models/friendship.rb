# == Schema Information
#
# Table name: friendships
#
#  id           :integer          not null, primary key
#  requestor_id :integer          not null
#  requestee_id :integer          not null
#  accepted     :boolean          default(FALSE), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Friendship < ActiveRecord::Base
  validates :requestor_id, :requestee_id, presence: true
  validates :requestor_id, uniqueness: {scope: :requestee_id}
  validates :accepted, inclusion: {in: [true, false]}

  belongs_to(
    :requestor,
    class_name: :User,
    foreign_key: :requestor_id
  )

  belongs_to(
    :requestee,
    class_name: :User,
    foreign_key: :requestee_id
  )
end
