class StyleGuidePolicy < ApplicationPolicy
  def index?
    (user && user.employee?) || Rails.env.test?
  end
end
