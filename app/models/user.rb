class User < ApplicationRecord
  has_many :user_videos
  has_many :videos, through: :user_videos
  has_one :github_token

  validates :email, uniqueness: true, presence: true
  validates_presence_of :password
  validates_presence_of :first_name
  enum role: [:default, :admin]
  has_secure_password

  # def self.current
  #   Thread.current[:user]
  # end

  # def self.current=(user)
  #   Thread.current[:user] = user
  # end
end