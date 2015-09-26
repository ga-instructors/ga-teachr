module GithubHelper

  # Helper for accessing the configured GitHub client
  def github
    Rails.application.config.github
  end

end
