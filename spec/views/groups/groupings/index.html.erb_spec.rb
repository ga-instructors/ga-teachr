require 'rails_helper'

RSpec.describe "groups/groupings/index", type: :view do
  before(:each) do
    assign(:groups_groupings, [
      Groups::Grouping.create!(
        :cohort => nil,
        :name => "Name"
      ),
      Groups::Grouping.create!(
        :cohort => nil,
        :name => "Name"
      )
    ])
  end

  it "renders a list of groups/groupings" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
