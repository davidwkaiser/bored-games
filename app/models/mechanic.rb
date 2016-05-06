class Mechanic < ActiveRecord::Base
  validates :description, presence: true
  has_many :game_mechanics
  has_many :games, through: :game_mechanics

  def self.top_mechanics
    @mechs = Hash.new 0
    mechanics = []
    Game.all.each do |game|
      game.mechanics.each do |mechanic|
        @mechs[mechanic] += 1
      end
    end
    @mechs = @mechs.sort_by{|mech, count| count}.reverse
    @mechs = @mechs.first(10)
    @mechs.each do |mech, count|
      mechanics << mech
    end
    mechanics
  end
end
