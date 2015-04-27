require 'spec_helper'

module Kendocup
  RSpec.describe Cup, type: :model do
    it {should have_many(:individual_categories).dependent(:destroy)}
    it {should have_many(:team_categories).dependent(:destroy)}
    it {should have_many(:events).dependent :destroy}
    it {should have_many(:headlines).dependent :destroy}
    it {should have_many(:kenshis).dependent :destroy}
    it {should have_many(:products).dependent :destroy}
    it {should respond_to(:start_on)}
    it {should respond_to(:end_on)}
    it {should respond_to(:deadline)}
    it {should respond_to(:year)}

    it {should validate_presence_of :start_on}
    it {should validate_presence_of :deadline}
    it {should validate_presence_of :adult_fees_chf}
    it {should validate_presence_of :adult_fees_eur}
    it {should validate_presence_of :junior_fees_chf}
    it {should validate_presence_of :junior_fees_eur}
    it {should validate_uniqueness_of :start_on}

    context "A cup created without deadline" do
      let(:cup){create :kendocup_cup}

      it {expect(cup.deadline).to_not be_nil}
    end

    context "4 cups, 2 pasts, 2 futures" do
      let!(:cup1){create :kendocup_cup, start_on: Date.current-2.years}
      let!(:cup2){create :kendocup_cup, start_on: Date.current-1.years}
      let!(:cup3){create :kendocup_cup, start_on: Date.current+1.year}
      let!(:cup4){create :kendocup_cup, start_on: Date.current+2.year}

      it {expect(cup1).to be_past}
      it {expect(cup4).to_not be_past}
      it {expect(Cup.all).to match_array [cup1, cup2, cup3, cup4]}
      it {expect(Cup.past).to match_array [cup1, cup2]}
      it {expect(Cup.future).to match_array [cup3, cup4]}
    end
  end
end
