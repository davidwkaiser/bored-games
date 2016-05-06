class User < ActiveRecord::Base
  has_secure_password
  # attr_accessible :username, :password_digest
  validates :username, uniqueness: true

  ### Uncomment associations as they are created
  has_many :votes
  has_many :additions
  has_many :games, through: :additions
  has_many :votes
  has_many :voted_games, through: :votes, class_name: "Game"
  has_many :received_relationships, class_name: "Relationship", foreign_key: :sender_id
  has_many :sent_relationships, class_name: "Relationship", foreign_key: :receiver_id
  has_many :requested_friends, through: :sent_relationships, source: :sender
  has_many :friend_requests, through: :received_relationships, source: :receiver
  has_many  :comments

  def friends
    friends = self.requested_friends + self.friend_requests
    friends.uniq!
  end

  # def games
  #   Game.all
  # end
end
