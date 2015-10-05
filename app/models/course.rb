class Course < ActiveRecord::Base
  has_many :cohorts
end
