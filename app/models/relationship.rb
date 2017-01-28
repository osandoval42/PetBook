# == Schema Information
#
# Table name: relationships
#
#  id           :integer          not null, primary key
#  requestor_id :integer          not null
#  requestee_id :integer          not null
#  accepted     :boolean          default(FALSE), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Relationship < ActiveRecord::Base
  validates :requestor_id, :requestee_id, presence: true, uniqueness: true
  validates :accepted, inclusion: {in: [true, false]}

  belongs_to(
    :requestor,
    class_name: :user,
    foreign_key: :requestor_id
  )

  belongs_to(
    :requestee,
    class_name: :user,
    foreign_key: :requestee_id
  )


end
