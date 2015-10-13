class Survey::QuestionPolicy < ApplicationPolicy

  def update?
    user && user.employee
  end

  def create
    user && user.employee
  end

  class Scope < Scope
  end
end
