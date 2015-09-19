class ApplicationController < ActionController::Base
  include Pundit

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  around_action :set_timezone, if: -> { session[:tz] }
  after_action :verify_authorized, :except => :index
  after_action :verify_policy_scoped, :only => :index

  private

  def set_timezone(&block)
    Time.use_zone(session[:tz], &block)
  end

end
