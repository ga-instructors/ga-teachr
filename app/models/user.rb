class User < ActiveRecord::Base
  belongs_to :employee
  belongs_to :student
  has_many :authentications
  has_secure_password

  def name
    (employee || student).name
  end

  def campus
    (employee || student).campus
  end

end
