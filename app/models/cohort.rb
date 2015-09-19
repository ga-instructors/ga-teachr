class Cohort < ActiveRecord::Base
  belongs_to :campus
  belongs_to :course
end
