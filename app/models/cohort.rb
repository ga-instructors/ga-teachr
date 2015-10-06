require 'fileutils'

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

  attr_accessor :banner
  after_save if: -> { @banner } do
    default_filename = id.to_s + File.extname(@banner.path)
    original_filename = [id, 'orig'].join('.')+File.extname(@banner.path)
    original_path = Rails.root.join('public','cohorts', original_filename)
    FileUtils.mv @banner.path, original_path
    image = MiniMagick::Image.open(original_path)
    image.resize '1000x'
    image.level '0%,100%,0.5'
    image.write Rails.root.join('public','cohorts', default_filename)
  end

end
