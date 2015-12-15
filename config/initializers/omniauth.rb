Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET'], scope: "user:email,repo"
end
OmniAuth.config.logger = Rails.logger
OmniAuth.config.full_host = "http://teachr.generalassemb.ly"
