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
  has_many :groupings, class_name: Groups::Grouping

  validates :campus, :course, :name, :begins_at, :ends_at, presence: true

  def browse(path='/')
    github.contents(github_repo, path: path)
  end

  def log
    github.commits(github_repo)
  end

  private

  def github
    @github ||= Octokit::Client.new(
                                    # TODO: CONFIG LOGIN
    )
  end

end
