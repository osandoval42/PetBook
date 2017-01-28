# == Schema Information
#
# Table name: photos
#
#  id         :integer          not null, primary key
#  album_id   :integer          not null
#  img_url    :string           not null
#  profile    :boolean          default(FALSE)
#  cover      :boolean          default(FALSE), not null
#  date       :date             not null
#  caption    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Photo < ActiveRecord::Base
  before_save :default_values
  validates :album_id, :img_url, :date, presence: true
  validates :profile, inclusion: {in: [true, false]}
  validates :cover, inclusion: {in: [true, false]}
  after_save :ensure_single_cover_and_profile

  def default_values
    self.profile ||= false
    return true
  end

  def ensure_single_cover_and_profile
    ensure_single_profile if self.profile == true
    ensure_single_cover if self.cover == true
  end

  def ensure_single_profile
     neighbors = self.album.photos.where('profile = ? AND id != ?', true, self.id)
     neighbors.each do |neighbor|
      neighbor.profile = false;
      neighbor.save
     end
  end

  def ensure_single_cover
    neighbors = self.album.photos.where('cover = ? AND id != ?', true, self.id)
    neighbors.each do |neighbor|
     neighbor.cover = false;
     neighbor.save
    end
  end

  belongs_to(
    :album
  )

  has_one(
    :user,
    through: :album,
    source: :user
  )

  has_many(
    :comments,
    class_name: :photo_comment,
    foreign_key: :photo_id,
  )

  has_many(
    :likes,
    class_name: :photo_like,
    foreign_key: :photo_id
  )

  has_many(
    :taggings
  )
end
