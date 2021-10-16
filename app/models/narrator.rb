class Narrator < User
  has_many :narratives, foreign_key: :user_id
end