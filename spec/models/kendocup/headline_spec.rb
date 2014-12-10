require 'spec_helper'

module Kendocup
  RSpec.describe Headline, type: :model do

    it {should belong_to :cup}

    it {should respond_to :title_en}
    it {should respond_to :title_fr}
    it {should respond_to :content_en}
    it {should respond_to :content_fr}
    it {should respond_to :shown}

    it {should validate_presence_of :title_en}
    it {should validate_presence_of :title_en}
    it {should validate_presence_of :content_fr}
    it {should validate_presence_of :content_fr}
    it {should validate_presence_of :cup_id}
  end

  describe "An headline shown and a not shown" do
    let(:cup){create :kendocup_cup}
    let!(:headline_shown){create :kendocup_headline, title_fr: "un titre", title_en: "a title", cup: cup, shown: true}
    let!(:headline_not_shown){create :kendocup_headline, cup: cup, shown: false}

    it{expect(Headline.shown.to_a).to eql [headline_shown]}
    it{expect(headline_shown.to_param).to eql "#{headline_shown.id}-a-title"}
  end
end
