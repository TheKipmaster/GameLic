class User < ApplicationRecord
  belongs_to :narrative, optional: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :messages
  has_many :conversations, foreign_key: :sender_id

  def student?
    type == 'Student'
  end

  def narrator?
    type == 'Narrator'
  end
end
