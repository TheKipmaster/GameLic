class Narrative < ApplicationRecord
  has_many :students
  belongs_to :narrator, foreign_key: :user_id, optional: true

  def self.open?
    self.first.open
  end

  def self.toggle_open
    # .where(archived: false)
    self.update_all(open: !self.open?)
  end

end
