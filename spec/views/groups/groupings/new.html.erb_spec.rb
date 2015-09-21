require 'rails_helper'

RSpec.describe "groups/groupings/new", type: :view do
  before(:each) do
    assign(:groups_grouping, Groups::Grouping.new(
      :cohort => nil,
      :name => "MyString"
    ))
  end

  it "renders new groups_grouping form" do
    render

    assert_select "form[action=?][method=?]", groups_groupings_path, "post" do

      assert_select "input#groups_grouping_cohort_id[name=?]", "groups_grouping[cohort_id]"

      assert_select "input#groups_grouping_name[name=?]", "groups_grouping[name]"
    end
  end
end
