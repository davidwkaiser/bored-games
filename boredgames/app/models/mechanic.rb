class Mechanic < ActiveRecord::Base
  validates :description, presence: true
  has_many :game_mechanics
  has_many :games, through: :game_mechanics
end
