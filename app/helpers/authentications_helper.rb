module AuthenticationsHelper

  def current_auth
    @auth ||= Authentication.find_by(token: session[:tk])
  end

  def current_user
    current_auth.try(:user)
  end

end
