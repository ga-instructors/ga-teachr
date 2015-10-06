class CohortPolicy < ApplicationPolicy

  def update?
    user && user.employee && @record.functions.where(employee_id: user.employee_id)
  end

  def manage_students?
    update?
  end

  def create?
    user && user.employee
  end

  def show?
    user && user.employee
  end

  class Scope < Scope
    def resolve
      if user && user.employee
        scope.joins(:functions).where(cohort_functions: { employee_id: user.employee_id })
      elsif user && user.student
        scope.all
      else
        scope.all
      end
    end
  end
end
