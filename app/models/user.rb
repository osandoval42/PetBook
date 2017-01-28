# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  email           :string           not null
#  session_token   :string           not null
#  gender          :string
#  breed           :string
#  birthday        :date
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  validates :username, :password_digest, :email, :session_token, presence: true
  validates :password, length: {minimum: 6, allow_nil: true}
  validates :session_token, :email, uniqueness: true
  validates :gender, inclusion: {in: ["Male", "Female"]}, allow_nil: true
  after_initialize :ensure_session_token
  after_create :create_albums

  attr_reader :password

  PROFILE_DEFAULT = 'http://www.hellasmultimedia.com/webimages/back-htm/backgrounds/back1/BG070.JPG'

  DEFAULT_ALBUM_TITLES = {
    profile: "Profile Pictures",
    cover: "Cover Photos"
  }

  has_many(
    :friend_requests_made,
    class_name: :Friendship,
    foreign_key: :requestor_id
  )
  has_many(
    :friend_requests_received,
    class_name: :Friendship,
    foreign_key: :requestee_id
  )



  def friends
    binds = {id: self.id}

    friend_ids = Friendship.find_by_sql([<<-SQL, binds])
      SELECT
        users.id AS user_id
      FROM friendships f
      JOIN users ON users.id = f.requestor_id
      WHERE f.requestee_id = :id
        AND f.accepted = 'true'
      UNION
      SELECT
        users.id AS user_id
      FROM friendships f
      JOIN users ON users.id = f.requestee_id
      WHERE f.requestor_id = :id
        AND f.accepted = 'true'
    SQL


    friend_ids = friend_ids.map do |friend|
      friend.user_id
    end

    return [] if friend_ids.empty?

    User.where(id: friend_ids)
  end

  def outstanding_requests
    binds = {id: self.id}

    friend_requested_ids = Friendship.find_by_sql([<<-SQL, binds])
      SELECT
        users.id AS user_id
      FROM friendships f
      JOIN users ON users.id = f.requestee_id
      WHERE f.requestor_id = :id
        AND f.accepted = 'false'
    SQL

    friend_requested_ids = friend_requested_ids.map do |friend|
      friend.user_id
    end

    return [] if friend_requested_ids.empty?

    User.where(id: friend_requested_ids)
  end

  def friend_requests
    binds = {id: self.id}

    friend_requestor_ids = Friendship.find_by_sql([<<-SQL, binds])
      SELECT
        users.id AS user_id
      FROM friendships f
      JOIN users ON users.id = f.requestor_id
      WHERE f.requestee_id = :id
        AND f.accepted = 'false'
    SQL

    friend_requestor_ids = friend_requestor_ids.map do |friend|
      friend.user_id
    end

    return [] if friend_requestor_ids.empty?

    User.where(id: friend_requestor_ids)
  end

  def friend_requests_pending
    outstanding_requests + friend_requests
  end

  has_one(
    :relationship_made,
    class_name: :Relationship,
    foreign_key: :requestor_id
  )
  has_one(
    :relationship_accepted,
    class_name: :Relationship,
    foreign_key: :requestee_id
  )

  def partner

  end

  has_many(
    :messages_recieved,
    class_name: :Messages,
    foreign_key: :receiver_id
  )
  has_many(
    :messages_sent,
    class_name: :Messages,
    foreign_key: :sender_id
  )



  has_many(
    :taggings
  )

  has_many(
    :albums
  )

  has_many(
    :photo_likes
  )

  has_many(
    :post_likes
  )

  has_many(
    :posts_authored,
    class_name: :Post,
    foreign_key: :author_id
  )

  has_many(
    :wall_posts,
    class_name: :Post,
    foreign_key: :wall_id
  )

  # def wall_posts
  #   self.unsorted_wall_posts.sort do |left, right|
  #     right.id <=> left.id
  #   end
  # end

  def feed_posts
    friends = self.friends
    feed_posts = self.wall_posts;
    friends.each do |friend|
      feed_posts = feed_posts + friend.wall_posts
    end

    # feed_posts.sort! do |left, right|
    #   right.id <=> left.id
    # end

    feed_posts
  end

  has_many(
    :shares
  )

  has_many(:photos,
  	through: :albums,
    source: :photos
    )

  has_many :comments,
  	foreign_key: :user_id,
  	class_name: "Comment"


	def password= password
		self.password_digest = BCrypt::Password.create(password)
		@password = password
	end

  def profile_pic
    arr = self.photos.where(profile: true)

    unless arr.length >= 1
      return Fake_Photo.new(PROFILE_DEFAULT)
    end

    arr[0]
  end

  def profile_album_id
    self.albums.find_by_title(DEFAULT_ALBUM_TITLES[:profile]).id
  end

  def cover_album_id
    self.albums.find_by_title(DEFAULT_ALBUM_TITLES[:cover]).id
  end

  def cover_photo
    arr = self.photos.where(cover: true)

    unless arr.length >= 1
      return Fake_Photo.new(PROFILE_DEFAULT)
    end

    arr[0]
  end

	def self.find_by_credentials email, password
		user = User.find_by(email: email)
		return nil unless user
		user.password_is?(password) ? user : nil
	end

	def password_is? password
		BCrypt::Password.new(self.password_digest).is_password?(password)
	end

	def reset_session_token!
		self.session_token = new_session_token
    self.save!
		self.session_token
	end

	private

	def ensure_session_token
		self.session_token ||= new_session_token
	end

	def new_session_token
		SecureRandom::urlsafe_base64(16)
	end

  def create_albums
    Album.create({title: DEFAULT_ALBUM_TITLES[:profile], user_id: self.id});
    Album.create({title: DEFAULT_ALBUM_TITLES[:cover], user_id: self.id});
  end

end

class Fake_Photo
  #include singleton
  attr_reader :img_url

  def initialize(img_url)
    @img_url = img_url
  end
end
