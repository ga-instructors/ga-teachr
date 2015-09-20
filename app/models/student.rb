class Student < ActiveRecord::Base
  belongs_to :cohort

  has_one :user
  accepts_nested_attributes_for :user
  validates :first_name, :email, presence: true

  has_many :registrations
  has_many :cohorts, through: :registrations

  after_initialize do
    build_user if user.blank? && new_record?
  end

  def name
    [first_name, last_name].join(' ')
  end

  def github
    @github ||= Octokit.user(github_username)
  end

end
