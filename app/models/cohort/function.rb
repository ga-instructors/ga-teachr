class Cohort::Function < ActiveRecord::Base
  belongs_to :cohort
  belongs_to :employee

  delegate :first_name, :last_name,
           :name, :email,
           :to_partial_path,
           :to => :employee
end
