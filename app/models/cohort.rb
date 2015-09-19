class Cohort < ActiveRecord::Base
  belongs_to :campus
  belongs_to :course

  has_many :functions
  has_many :instructors
  has_many :associates
  has_many :producers
  has_many :assistants

  validates :campus, :course, :name, presence: true
end
