class Survey::QuestionnairePolicy < ApplicationPolicy
  def create?
    user && user.employee
  end

  def update?
    true
  end
end
