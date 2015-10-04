class Survey::QuestionnairePolicy < ApplicationPolicy
  def create?
    true
  end

  def update?
    true
  end
end
