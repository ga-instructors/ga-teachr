class Authentication < ActiveRecord::Base
  belongs_to :user
  attr_accessor :user_email, :password, :provider, :error, :error_description, :state, :request
  validates :user, presence: true

  before_validation :populate_from_request, on: :create, if: -> { request }
  before_validation :validate_password, on: :create, if: -> { type == 'Authentication' }

  def self.new(attributes={})
    if self ==  Authentication && attributes[:provider] == 'github'
      Authentication::Github.new(attributes)
    else super(attributes)
    end
  end

  def timezone
    user.campus.timezone
  end

  private

  def populate_from_request
    self.ip_address = request.remote_ip
    self.user_agent = request.user_agent
    self.accept_language = request.env['HTTP_ACCEPT_LANGUAGE']
  end

  def role
    Student.find_by(email: @user_email) || Employee.find_by(email: @user_email)
  end

  def validate_password
    login if role && role.user.authenticate(@password)
    self.token = SecureRandom.urlsafe_base64
  end

  def login
    self.user = role.user
  end

end
