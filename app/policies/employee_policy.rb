class EmployeePolicy < ApplicationPolicy

  def new?
    user.employee.try(:admin?)
  end

  def edit?
    user == record.user
  end

  class Scope < Scope
  end
end
