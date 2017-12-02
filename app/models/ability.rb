class Ability
  include CanCan::Ability

  def initialize(user)
    if user
      can :read, :all
      can :manage, Post, user_id: user.id
      can :manage, Follow, user_id: user.id 
      can :manage, Like, user_id: user.id 
      can :manage, Comment, user_id: user.id
    end
  end
end