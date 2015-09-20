require 'spec_helper'

module Kendocup
  describe Cup, type: :model do
    it {is_expected.to have_many(:individual_categories).dependent(:destroy)}
    it {is_expected.to have_many(:team_categories).dependent(:destroy)}
    it {is_expected.to have_many(:events).dependent :destroy}
    it {is_expected.to have_many(:headlines).dependent :destroy}
    it {is_expected.to have_many(:kenshis).dependent :destroy}
    it {is_expected.to have_many(:products).dependent :destroy}
    it {is_expected.to respond_to(:start_on)}
    it {is_expected.to respond_to(:end_on)}
    it {is_expected.to respond_to(:deadline)}
    it {is_expected.to respond_to(:year)}
    it {is_expected.to respond_to(:participations)}

    it {is_expected.to validate_presence_of :start_on}
    # it {is_expected.to validate_presence_of :deadline} set in before save
    it {is_expected.to validate_presence_of :adult_fees_chf}
    it {is_expected.to validate_presence_of :adult_fees_eur}
    it {is_expected.to validate_presence_of :junior_fees_chf}
    it {is_expected.to validate_presence_of :junior_fees_eur}
    it {is_expected.to validate_uniqueness_of :start_on}
  end

  describe "A cup without deadline" do
    let(:cup){create :kendocup_cup}
    it {expect(cup.deadline).to_not be_nil}
  end

  describe "4 cups, 2 pasts, 2 futures" do
    before { Kendocup::Cup.destroy_all }
    let!(:cup1){create :kendocup_cup, start_on: Date.current-2.years}
    let!(:cup2){create :kendocup_cup, start_on: Date.current-1.years}
    let!(:cup3){create :kendocup_cup, start_on: Date.current+1.year}
    let!(:cup4){create :kendocup_cup, start_on: Date.current+2.year}

    it {expect(cup1).to be_past}
    it {expect(Cup.count).to eql 4}
    it {expect(cup4).to_not be_past}
    it {expect(Cup.all).to match_array [cup1, cup2, cup3, cup4]}
    it {expect(Cup.past).to match_array [cup1, cup2]}
    it {expect(Cup.future).to match_array [cup3, cup4]}
  end
end
