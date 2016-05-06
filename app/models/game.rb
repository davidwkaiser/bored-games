class Game < ActiveRecord::Base
  validates :name, :description, :play_time, :min_players, :max_players, :year_published, presence: true

  has_many :game_mechanics
  has_many :mechanics, through: :game_mechanics
  has_many :votes, as: :voteable
  has_many :additions
  has_many :users, through: :additions
  has_many :votes, as: :voteable
  has_many  :comments
end
