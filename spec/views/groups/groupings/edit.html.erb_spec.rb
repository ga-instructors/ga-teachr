require 'rails_helper'

RSpec.describe "groups/groupings/edit", type: :view do
  before(:each) do
    @groups_grouping = assign(:groups_grouping, Groups::Grouping.create!(
      :cohort => nil,
      :name => "MyString"
    ))
  end

  it "renders the edit groups_grouping form" do
    render

    assert_select "form[action=?][method=?]", groups_grouping_path(@groups_grouping), "post" do

      assert_select "input#groups_grouping_cohort_id[name=?]", "groups_grouping[cohort_id]"

      assert_select "input#groups_grouping_name[name=?]", "groups_grouping[name]"
    end
  end
end
