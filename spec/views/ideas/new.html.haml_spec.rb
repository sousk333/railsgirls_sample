require 'rails_helper'

RSpec.describe "ideas/new", type: :view do
  before(:each) do
    assign(:idea, Idea.new(
      :name => "MyString",
      :description => "MyText",
      :picture => "MyString"
    ))
  end

  it "renders new idea form" do
    render

    assert_select "form[action=?][method=?]", ideas_path, "post" do

      assert_select "input#idea_name[name=?]", "idea[name]"

      assert_select "textarea#idea_description[name=?]", "idea[description]"

      assert_select "input#idea_picture[name=?]", "idea[picture]"
    end
  end
end
