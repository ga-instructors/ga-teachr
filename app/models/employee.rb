class Employee < ActiveRecord::Base
  belongs_to :campus
  has_one :user

  has_many :cohort_functions, class_name: Cohort::Function
  has_many :cohorts, through: :cohort_functions

  validates :first_name, :title, :email, presence: true
  accepts_nested_attributes_for :user

  after_initialize do
    build_user if user.blank? && new_record?
  end

  def name
    [first_name, last_name].join(' ')
  end

end
