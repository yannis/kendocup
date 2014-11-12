require 'spec_helper'

RSpec.describe "cups/new", :type => :view do
  before(:each) do
    assign(:cup, Cup.new())
  end

  it "renders new cup form" do
    render

    assert_select "form[action=?][method=?]", cups_path, "post" do
    end
  end
end
