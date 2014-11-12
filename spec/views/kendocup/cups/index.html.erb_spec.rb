require 'spec_helper'

RSpec.describe "cups/index", :type => :view do
  before(:each) do
    assign(:cups, [
      Cup.create!(),
      Cup.create!()
    ])
  end

  it "renders a list of cups" do
    render
  end
end
