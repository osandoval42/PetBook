# == Schema Information
#
# Table name: messages
#
#  id          :integer          not null, primary key
#  body        :text             not null
#  sender_id   :integer          not null
#  receiver_id :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Message < ActiveRecord::Base
  validates :sender_id, :receiver_id, :body, presence: true

  belongs_to(
    :sender,
    class_name: :user,
    foreign_key: :sender_id
  )

  belongs_to(
    :receiver,
    class_name: :user,
    foreign_key: :receiver_id
  )

end
