require 'rails_helper'

RSpec.describe "groups/groupings/show", type: :view do
  before(:each) do
    @groups_grouping = assign(:groups_grouping, Groups::Grouping.create!(
      :cohort => nil,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
  end
end
