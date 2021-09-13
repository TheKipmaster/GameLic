class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  def promote # @TODO: remover referencias para narrativas
    self.type = "Narrator"
    save
  end

  def demote
    self.type = "Student"
    save
  end

  def student?
    type == 'Student'
  end

  def narrator?
    type == 'Narrator'
  end
end
