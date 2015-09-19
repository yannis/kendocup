require 'spec_helper'

module Kendocup
  RSpec.describe Event, type: :model do
    it {should belong_to :cup}

    it {should respond_to :name_en}
    it {should respond_to :name_fr}
    it {should respond_to :name_de}
    it {should respond_to :start_on}
    it {should respond_to :duration}
    it {should respond_to :year}

    it {should validate_presence_of :cup_id}
    it {should validate_presence_of :name_fr}
    it {should validate_presence_of :name_en}
    it {should validate_presence_of :start_on}

    describe "A event", type: :model do
      let!(:event) {create :kendocup_event, cup: create(:kendocup_cup, start_on: Date.parse("2016-09-28"))}
      it {expect(event.year).to eql 2016}
    end
  end
end
