class Cohort < ActiveRecord::Base

  belongs_to :course
  belongs_to :campus
  validates :campus, :course, :name, :begins_at, :ends_at, presence: true

  has_many :functions
  has_many :instructors
  has_many :associates
  has_many :producers
  has_many :assistants

  has_many :registrations, class_name: Student::Registration
  has_many :registrants, through: :registrations, source: :student
  has_many :students, -> { merge(Student::Registration.current) }, through: :registrations
  has_many :drops, -> { merge(Student::Registration.dropped) }, through: :registrations, source: :student
  has_many :groupings, class_name: Groups::Grouping

  has_many :surveys, class_name: Survey::Questionnaire

end
