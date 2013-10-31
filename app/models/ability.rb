class Ability
  include CanCan::Ability
    def initialize(user)
      user ||= User.new # guest user (not logged in)
      if user.role? :admin
        can :manage, :all
      elsif user.role? :user
        can :manage, Track
        can :read, :all
      end
        can :read, Home  
    end
end