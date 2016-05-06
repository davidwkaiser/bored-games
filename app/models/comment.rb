class Comment < ActiveRecord::Base
  belongs_to  :game
  belongs_to  :user
  has_many    :votes, :as => :voteable

  validates :user_id, presence: true
  validates :game_id, presence: true
  validates :body, presence: true

end
