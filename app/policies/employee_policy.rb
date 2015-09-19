class EmployeePolicy < ApplicationPolicy

  def new?
    user.employee.try(:admin?)
  end

  class Scope < Scope
  end
end
