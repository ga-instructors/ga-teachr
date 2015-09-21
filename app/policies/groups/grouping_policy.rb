class Groups::GroupingPolicy < ApplicationPolicy

  def create?
    user && user.employee
  end
  
end
