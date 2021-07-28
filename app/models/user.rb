class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
<<<<<<< HEAD

  has_many :messages
  has_many :conversations, foreign_key: :sender_id
=======
>>>>>>> origin/Mail_Narrative

  def student?
    type == 'Student'
  end

  def narrator?
    type == 'Narrator'
  end
end
