class Cohort < ActiveRecord::Base
  belongs_to :campus
  belongs_to :course

  has_many :functions
  has_many :instructors
  has_many :associates
  has_many :producers
  has_many :assistants

  has_many :registrations, class_name: Student::Registration
  has_many :students, through: :registrations

  validates :campus, :course, :name, :begins_at, :ends_at, presence: true

  def github
    @github ||= Octokit.repo(github_repo)
  end

end
