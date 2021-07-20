class Narrative < ApplicationRecord
  has_many :students
  belongs_to :narrator, foreign_key: :user_id, optional: true
  has_one_attached :avatar
  # validates :user_id, uniqueness: true # { scope: archived: false }

  def self.open?
    self.first.open
  end

  def self.toggle_open
    # .where(archived: false)
    self.update_all(open: !self.open?)
  end

  def full?
    size == students.length
  end

end
