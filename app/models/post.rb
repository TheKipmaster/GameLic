class Post < ApplicationRecord
  belongs_to :user
  belongs_to :narrative, optional: true
  has_many_attached :files
end
