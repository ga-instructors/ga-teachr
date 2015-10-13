class Survey::QuestionnairePolicy < ApplicationPolicy

  def create?
    user && user.employee
  end

  def update?
    user && user.employee && @record.cohort.functions.where(employee_id: user.employee_id)
  end

end
