class Cohort::Function < ActiveRecord::Base
  belongs_to :cohort
  belongs_to :employee

  delegate :name, :email, :to_partial_path, to: :employee
end
