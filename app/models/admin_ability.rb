class AdminAbility
  include CanCan::Ability
  def initialize(user)
    user ||= User.new # guest user

    if user.role? :admin
      can :manage, :all
    end
  end
end

