class CohortPolicy < ApplicationPolicy

  def update?
    user && user.employee && @record.functions.where(employee_id: user.employee_id)
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
