class CampusPolicy < ApplicationPolicy

  def update?
    user && user.employee
  end

end
