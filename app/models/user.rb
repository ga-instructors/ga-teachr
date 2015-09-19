class User < ActiveRecord::Base
  belongs_to :employee
  belongs_to :student
  has_secure_password

  def name
    (employee || student).name
  end

end
