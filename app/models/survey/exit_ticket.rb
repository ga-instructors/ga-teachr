class Survey::ExitTicket < Survey::Questionnaire
  after_initialize :set_initial_title

  private

  def set_initial_title
    self[:title] ||= "Exit Ticket for #{Time.zone.now.to_date.to_s(:long)}"
  end

end
