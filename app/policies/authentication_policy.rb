class AuthenticationPolicy < ApplicationPolicy

  def index
    user
  end

  def create?
    true
  end

  def update?
    false
  end
  
  def destroy?
    user
  end

  def show?
    user && record.user == user
  end

  class Scope < Scope
    def resolve
      scope.where(user_id: user.id)
    end
  end

end
