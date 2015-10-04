class StyleGuidePolicy < ApplicationPolicy
  def index?
    user && user.employee?
  end
end
