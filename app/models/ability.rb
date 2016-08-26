class Ability
  include CanCan::Ability

  def initialize(user)

    if user.nil?    # user정보가 있는지 체크, 즉 로그인 했는지 안했는지를 체크한다.
      can :read, :all   # 비로그인유저가 할 수 있는 일
    elsif user.has_role? :admin  # user가 admin 계정인지 체크함, 이는 뒤쪽에서 rolify를 통해 추가할 예정
      can :manage, :all         # 가장 강력한 can 어빌인 manage를 모든(:all) 모델에 대해 권한을 가진다.
    else                        # 나머지 유저들, 만약 권한을 더 세분화 하고 싶다면 elsif user.has_role? :wirter 등으로하여 나누면 된다.
      can :manage, Notice_comment, user_id: user.id   #Post 모델에 대해선만 manage 권한을 가진다. 뒤에 user_id: user.id 는 자기글만 수정, 삭제하게 만들어준다.
      #can :manage, Qna, user_id: user.id
      can :read, :all                       #모든 모델에 대해 읽을 권한을 준다.
    end




    
    # if user.has_role? :admin
    #   can :manage, :all
      
    # elsif user.has_role? :writer
    #   can :manage, Notice_comment, user_id: user.id      
    
    # else
    #   can :read, :all
    # end      
    
    
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
  end
end
