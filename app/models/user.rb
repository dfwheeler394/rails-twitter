class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # create user associations
  has_many :tweets
  has_many :favorites

  #user is able to follower other users
  has_many :followed_users, foreign_key: :follower_id, class_name: "Following"

  # retrieve instances of the followed users in the followings table
  has_many :followees, through: :followed_users, source: :followee

  # the user has many followers
  has_many :follower_users, foreign_key: :followed_id, class_name: "Following"

  # retrive ID of users following the user
  has_many :followers, through: :follower_users, source: :follower
end
