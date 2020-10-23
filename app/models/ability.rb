class Ability
  include CanCan::Ability

  def initialize(member)
    can :read, Job, published: true
    can :search, Job, public: true
    if member.present?
      can :manage, Member, :member_id => member.id
      can :manage, Job, :member_id => member.id
    end

    # if member.admin? # additional permissions for administrators
    # can :manage, :all
    # end
  end
end
