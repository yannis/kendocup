require 'spec_helper'

module Kendocup
  RSpec.describe Club, :type => :model do
    it { should have_many :users}
    it { should have_many :kenshis}
    it { should validate_presence_of :name}
    it { should validate_uniqueness_of :name}
  end
end
