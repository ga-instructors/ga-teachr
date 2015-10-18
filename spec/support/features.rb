require 'rails_helper'
require 'capybara/rspec'
require 'capybara/poltergeist'
require 'capybara-screenshot/rspec'

module FeatureSpec
  autoload :Screenshots, 'support/features/screenshots'
  autoload :InjectSession, 'support/features/inject_session'

  module Concerns
    autoload :Authentication, 'features/concerns/authentication'
  end

  Capybara.javascript_driver = :poltergeist

  Capybara::Screenshot.register_filename_prefix_formatter(:rspec) do |example|
    example.full_description.parameterize
  end

end
