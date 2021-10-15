# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:

    user ||= User.new # guest user (not logged in)

    cannot :manage, :all

    if user.narrator?
      can :manage, [Narrative, User]
      cannot :choose_narrative, Narrative

      can :manage, Post, narrative: { narrator: user }
    elsif user.student?
      can [:read, :choose_narrative], Narrative, open: true

      cannot :index, User
      can [:view, :update], Student, id: user.id

      if user.narrative != nil
        can :read, Narrative, id: user.narrative.id
        can [:read, :create], Post, narrative: user.narrative
      end

      cannot [:create], Post, narrative: { open: true }
      can [:update, :destroy], Post, user: user
    end

    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
