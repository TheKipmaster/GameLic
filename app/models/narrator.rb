class Narrator < User
  has_one :narrative, foreign_key: :user_id
end