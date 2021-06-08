class Narrative < ApplicationRecord
  has_many :users

  def self.open?
    self.first.open
  end

  def self.toggle_open
    # .where(archived: false)
    self.update_all(open: !self.open?)
  end

end
