class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  # @TODO: método de promover e des-promover usuários. também deve remover as narrativas associadas

  def student?
    type == 'Student'
  end

  def narrator?
    type == 'Narrator'
  end
end
