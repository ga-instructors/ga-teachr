class StyleGuidePolicy < ApplicationPolicy
  def index?
    user && user.admin?
  end
end
