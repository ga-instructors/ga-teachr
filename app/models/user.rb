class User < ActiveRecord::Base
  belongs_to :employee
  belongs_to :student
  has_many :authentications
  has_secure_password

  def either
    (employee || student)
  end

  delegate :name, :email, :campus, :cohort, :cohorts, to: :either

  def employee?
    employee.present?
  end

  def student?
    student.present?
  end

end
