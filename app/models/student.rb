class Student < ActiveRecord::Base
  belongs_to :cohort

  has_one :user
  accepts_nested_attributes_for :user
  validates :first_name, :email, presence: true

  after_initialize do
    build_user if user.blank? && new_record?
  end

  def name
    [first_name, last_name].join(' ')
  end

end
