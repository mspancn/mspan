class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
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

    if user
      alias_action :create, :read, :update, :destroy, to: :crud

      # Active Teacher
      if user.class.name == "Teacher" and user.active?

        # Can crud their own availabilities
        can :crud, Availability, teacher_id: user.id

        # Can read and update their own appointments
        can [:read, :update], Appointment, teacher_id: user.id
      end

      # Inactive Teacher
      if user.class.name == "Teacher" and !user.active?

        # Can read their own appointments
        # can [:read], Appointment, teacher_id: user.id
      end

      # Student
      if user.class.name == "Student"

        # Can read, create and update their own appointments
        can [:read, :create, :update], Appointment, student_id: user.id

        # Can read, create and destroy the relationships with active teachers
        can [:read, :create, :destroy], Teacher, active: true
      end

      # Admin
      if user.class.name == "Admin" and user.enabled?

        # Can read and update teachers
        can [:read, :update], Teacher

        # Can read and update students
        can [:read, :update], Student
      end
    end
  end
end
