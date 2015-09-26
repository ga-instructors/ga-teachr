class Authentication::Github < Authentication
  before_validation :validate_provider, on: :create, if: -> { type != 'Authentication' }

  def client
    @client ||= Octokit::Client.new(access_token: token)
  end

  private

  def validate_provider
    if error then errors.add(:provider, "failed with: #{error_description}")
    else
      @user_email = request.env["omniauth.auth"].info.email
      login if role || find_role
    end
  end

  def find_role
    self.token = access_token = request.env["omniauth.auth"].credentials.token
    client = Octokit::Client.new(access_token: token)
    client.emails.detect do |email|
      @user_email = email[:email]
      role
    end
  end

end
