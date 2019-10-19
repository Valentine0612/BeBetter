class Task < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user
  validates :user_id, presence: true
  default_scope -> { order(created_at: :desc) }

  def start_time
    self.created_at
  end

  def end_time
    self.date_finish
  end
end
