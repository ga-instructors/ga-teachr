class Authentication < ActiveRecord::Base
  belongs_to :user
  attr_accessor :user_email, :password, :request
  validates :user, presence: true

  before_validation :populate_request, on: :create, if: -> { request }
  before_validation :validate_password, on: :create, if: -> { user_email && password }

  def timezone
    user.campus.timezone
  end

  private

  def populate_request
    self.ip_address = request.remote_ip
    self.user_agent = request.user_agent
    self.accept_language = request.env['HTTP_ACCEPT_LANGUAGE']
  end

  def validate_password
    role = (Student.find_by(email: @user_email) || Employee.find_by(email: @user_email))
    if role && role.user.authenticate(@password)
      self.user = role.user
      self.token = SecureRandom.urlsafe_base64
    end
  end

end
