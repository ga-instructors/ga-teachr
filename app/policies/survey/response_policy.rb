class Survey::ResponsePolicy < ApplicationPolicy
  def create?
    user && user.student? && @record.cohort.students.include?(user.student)
  end
end
