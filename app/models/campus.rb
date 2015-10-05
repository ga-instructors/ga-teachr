class Campus < ActiveRecord::Base
  has_many :cohorts

  def timezone
    if self[:timezone]
      ActiveSupport::TimeZone[self[:timezone]]
    else
      Time.zone
    end
  end

end
