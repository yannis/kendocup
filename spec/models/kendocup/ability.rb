class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new
    can :read, kendocup::Kenshi
    can :read, kendocup::Team
    can :read, kendocup::Headline
    # can :create, 'mailing_list'
    can :manage, 'mailing_list'
    if user.persisted?
      can [:create, :update, :destroy], kendocup::Kenshi, user_id: user.id
      # can [:create, :update, :destroy], Kenshi do |kenshi|
      #   Time.current < Kasahara::Application::REGISTRATION_DEADLINE
      # end
      can [:destroy], kendocup::Participation do |participation|
        participation.kenshi.user_id == user.id
      end
      can [:destroy], kendocup::Purchase do |purchase|
        purchase.kenshi.user_id == user.id
      end
      can [:read, :update, :destroy], kendocup::User, id: user.id
      if user.admin?
        can :manage, :all
      end
    end
  end
end
