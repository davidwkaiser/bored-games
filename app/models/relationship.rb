class Relationship < ActiveRecord::Base
  belongs_to :sender, class_name: "User"
  belongs_to :receiver, class_name: "User"

  validates :receiver_id,  presence: true
  validates :status, inclusion: { in: [true, false] }
  validates :sender, uniqueness: { scope: [:sender, :receiver] }
  validates :receiver, uniqueness: { scope: :sender }

  # def status=(new_status)
  #   self.status = new_status
  # end
end
