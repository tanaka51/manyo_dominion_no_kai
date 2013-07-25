require 'spec_helper'

describe "notes/index" do
  before(:each) do
    assign(:notes, [
      stub_model(Note,
        :title => "Title",
        :body => "MyText",
        :parent_id => 1,
        :creator => "Creator"
      ),
      stub_model(Note,
        :title => "Title",
        :body => "MyText",
        :parent_id => 1,
        :creator => "Creator"
      )
    ])
  end

  it "renders a list of notes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Creator".to_s, :count => 2
  end
end
