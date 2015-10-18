require 'database_cleaner'

RSpec.configure do |config|

  config.before(:suite) do
    DatabaseCleaner.clean_with :truncation 
  end

  config.before :each do |example|
    DatabaseCleaner.start unless example.metadata[:type] == :feature
  end

  config.after(:each) do |example|
    if example.metadata[:type] == :feature then DatabaseCleaner.clean_with :truncation
    else DatabaseCleaner.clean
    end
  end

end
