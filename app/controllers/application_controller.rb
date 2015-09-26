class ApplicationController < ActionController::Base
  include Pundit
  include AuthenticationsHelper

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  around_action :set_timezone, if: -> { session[:tz] }
  after_action :verify_authorized, :except => :index
  after_action :verify_policy_scoped, :only => :index

  rescue_from Pundit::NotAuthorizedError do
    if current_user.nil?
      redirect_to new_authentication_path, notice: 'You must login to do that'
    else
      redirect_to authentication_path(current_auth), notice: 'You do not have permission to do that'
    end
  end

  private

  def set_timezone(&block)
    Time.use_zone(session[:tz], &block)
  end


end
