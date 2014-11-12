require 'spec_helper'

module Kendocup
  RSpec.describe Purchase, :type => :model do
    it {should belong_to :kenshi}
    it {should belong_to :product}
  end
end
