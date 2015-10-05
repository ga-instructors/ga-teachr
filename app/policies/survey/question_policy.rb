class Survey::QuestionPolicy < ApplicationPolicy

  def create?
    user && user.employee
  end

  class Scope < Scope
  end
end
