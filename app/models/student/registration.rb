class Student::Registration < ActiveRecord::Base
  belongs_to :student
  belongs_to :cohort

  scope :dropped, -> { where(status: 'dropped') }
  scope :current, -> { where("status != 'dropped'")}
end
