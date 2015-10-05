class Groups::GroupingPolicy < ApplicationPolicy

  def create?
    user && user.employee
  end

  def update?
    user && user.employee
  end

end
