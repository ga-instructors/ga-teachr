module Survey
  class EvaluationPolicy < ApplicationPolicy
    class Scope < Scope
    end

    def create?
      user && user.employee
    end

  end
end
