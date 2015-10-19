require 'support/features'

RSpec.describe 'Style Guide', type: :feature, js: true do
  include FeatureSpec::Screenshots

  it 'should not change unexpectedly' do
    visit '/style-guide'
    expect(page).to take_screenshot_of('style-guide')
  end

end
