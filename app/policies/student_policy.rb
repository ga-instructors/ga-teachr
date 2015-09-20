class StudentPolicy < ApplicationPolicy

  def update?
    user && user.employee
  end

  class Scope < Scope
  end
end
