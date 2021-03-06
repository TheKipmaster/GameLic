class User < ApplicationRecord
  has_many :posts
  has_one_attached :avatar # TODO: character_portrait?
  has_one_attached :portrait
  has_one_attached :character_sheet
  has_one_attached :cover

  acts_as_messageable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  validate :subclass_validations

  def subclass_validations
    # if demoting a user, user can't be narrator to any narratives
    if self.class != self.type.classify.constantize && self.student?
      self.errors.add(:base, "associated narratives must have new narrator") unless self.narratives.length == 0
    end
  end

  def mailboxer_email(object)
    email
  end

  def sing_up_complete?
    if name != nil or institution != nil or registration_number != nil or nickname != nil or age != nil
      false
    else
      true
    end
  end

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

  def manager?
    type == 'Manager'
  end
end
