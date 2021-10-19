class Narrative < ApplicationRecord
  has_many :students
  has_many :posts
  belongs_to :narrator, foreign_key: :user_id
  has_one_attached :cover

  def self.default_scope
    where(main_forum: false) # archived: false
  end
  scope :include_main_forum, -> { unscope(where: :main_forum) }

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
