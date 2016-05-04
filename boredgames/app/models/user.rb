class User < ActiveRecord::Base
  has_secure_password
  # attr_accessible :username, :password_digest
  validates :username, uniqueness: true

  ### Uncomment associations as they are created
  has_many :additions
  has_many :games, through: :additions
  has_many :votes
  has_many :voted_games, through: :votes, class_name: "Game"
  has_many :relationships
  has_many :friends, through: :relationships, class_name: "User"
end
