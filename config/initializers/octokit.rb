Rails.application.config.github = Octokit::Client.new(
  client_id: ENV['GITHUB_KEY'],
  client_secret: ENV['GITHUB_SECRET']
)
