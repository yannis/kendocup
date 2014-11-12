require 'spec_helper'

RSpec.describe "cups/edit", :type => :view do
  before(:each) do
    @cup = assign(:cup, Cup.create!())
  end

  it "renders the edit cup form" do
    render

    assert_select "form[action=?][method=?]", cup_path(@cup), "post" do
    end
  end
end
