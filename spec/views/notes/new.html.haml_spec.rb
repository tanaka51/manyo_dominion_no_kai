require 'spec_helper'

describe "notes/new" do
  before(:each) do
    assign(:note, stub_model(Note,
      :title => "MyString",
      :body => "MyText",
      :parent_id => 1,
      :creator => "MyString"
    ).as_new_record)
  end

  it "renders new note form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", notes_path, "post" do
      assert_select "input#note_title[name=?]", "note[title]"
      assert_select "textarea#note_body[name=?]", "note[body]"
      assert_select "input#note_parent_id[name=?]", "note[parent_id]"
      assert_select "input#note_creator[name=?]", "note[creator]"
    end
  end
end
