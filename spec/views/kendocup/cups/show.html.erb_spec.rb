require 'spec_helper'

RSpec.describe "cups/show", :type => :view do
  before(:each) do
    @cup = assign(:cup, Cup.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
