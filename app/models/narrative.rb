class Narrative < ApplicationRecord
  has_many :students
  has_many :posts
  belongs_to :narrator, foreign_key: :user_id
  has_one_attached :cover

  acts_as_markdown :description

  def self.default_scope
    where(main_forum: false, archived: false)
  end

  scope :include_main_forum, -> { unscope(where: :main_forum) }
  scope :include_archived, -> { unscope(where: :archived) }
  scope :include_everything, -> { include_main_forum.include_archived }
  scope :archived, -> { include_archived.where(archived: true) }

  def self.open?
    self.first.open
  end

  def self.toggle_open
    self.update_all(open: !self.open?)
  end

  def self.archive
    self.update_all(archived: true)
  end

  def full?
    size == students.length
  end

end
