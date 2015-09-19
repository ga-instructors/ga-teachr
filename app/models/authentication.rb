class Authentication < ActiveRecord::Base
  belongs_to :user
  attr_accessor :user_email, :password
  validates :user, presence: true

  before_validation do
    if role = Student.find_by(email: @user_email) || Employee.find_by(email: @user_email)
      self.user = role.user.authenticate(@password)
    end
  end

end
