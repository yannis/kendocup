require 'spec_helper'

module Kendocup
  describe IndividualCategory do
    it {should belong_to :cup}
    it {should have_many(:fights).dependent(:destroy)}
    it {should have_many(:participations).dependent(:destroy)}
    it {should have_many(:kenshis).through(:participations)}

    it {should respond_to :name}
    it {should respond_to :pool_size}
    it {should respond_to :out_of_pool}
    it {should respond_to :pools}
    it {should respond_to :fights}
    it {should respond_to :tree}
    it {should respond_to :min_age}
    it {should respond_to :max_age}
    it {should respond_to :description}

    it {should validate_presence_of :cup_id}
    it {should validate_presence_of :name}
    it {should validate_uniqueness_of(:name).scoped_to(:cup_id)}
  end

  describe "A individual_category “open”", type: :model do
    let!(:individual_category) {create :kendocup_individual_category, name: 'open', pool_size: 3, out_of_pool: 2, cup: create(:kendocup_cup, start_on: Date.parse("2016-09-28"))}
    it {expect(individual_category).to be_valid_verbose}
    it {expect(individual_category.name).to eql 'open'}

    context "with a pool of 3 participations" do
      let!(:participation1){create :kendocup_participation, category: individual_category, pool_number: 1, pool_position: 1, kenshi: create(:kendocup_kenshi, cup: individual_category.cup)}
      let!(:participation2){create :kendocup_participation, category: individual_category, pool_number: 1, pool_position: 2, kenshi: create(:kendocup_kenshi, cup: individual_category.cup)}
      let!(:participation3){create :kendocup_participation, category: individual_category, pool_number: 1, pool_position: 3, kenshi: create(:kendocup_kenshi, cup: individual_category.cup)}

      it {expect(participation1).to be_valid_verbose}
      it {expect(participation1.category).to eql individual_category}
      it {expect(individual_category.pools.size).to eq 1}
      it {expect(individual_category.participations.size).to eq 3}
    end

    context "with 24 participations" do
      before {
        24.times do |i|
          kenshi = create :kendocup_kenshi, first_name: "fn_#{i}", last_name: "ln_#{i}", cup: individual_category.cup
          create :kendocup_participation, category_type: "Kendocup::IndividualCategory", category_id: individual_category.id, kenshi: kenshi
        end
        individual_category.reload
      }

      # it {expect(Participation.count).to eq 24}
      it {expect(individual_category.participations.count).to eq 24}
      it {expect(individual_category.pools.size).to eq 0}

      context "when pools are generated" do
        before {individual_category.set_smart_pools}

        it {expect(individual_category.pools.size).to eq 8}
        # it {expect(individual_category.tree).to be_a Tree}
        # it {expect(individual_category.data).to be_a Hash}
        # it {expect(individual_category.data.keys).to eq [:tree]}
        # it {expect(individual_category.data[:tree].keys).to eq [:elements, :depth, :branch_number]}
      end
    end
  end
end
