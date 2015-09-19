class Campus < ActiveRecord::Base
  def timezone
    if self[:timezone]
      ActiveSupport::TimeZone[self[:timezone]]
    else
      Time.zone
    end
  end
end
