class Survey::ResponsePolicy < ApplicationPolicy

  def create?
    user && user.student? && @record.cohort.registrations.where(student_id: user.student_id).any?
  end

  def update?
    create?
  end

end
