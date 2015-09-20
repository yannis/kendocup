require 'spec_helper'

module Kendocup
  RSpec.describe Team, type: :model do
    let!(:cup) {create :kendocup_cup, start_on: 1.years.since}
    let(:team_category){create :kendocup_team_category, name: "team_cat", cup: cup}
    let(:team){ create :kendocup_team, name: "SDK", team_category: team_category, participations: [] }

    it { should have_many :participations }
    it { should have_many :kenshis }
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name).scoped_to(:team_category_id) }

    describe "a empty team" do
      before { team.save! }
      it {expect(team.participations.count).to eq 0}
      it {expect(team).to be_valid_verbose}
      it {expect(team).to be_incomplete}
      it {expect(team.name_and_status).to eql "SDK"}
      it {expect(team.name_and_category).to eql "SDK (team_cat)"}
      it {expect(team.name_and_category).to eql "SDK (team_cat)"}
      it {expect(team.poster_name).to eql "SDK"}
      it {expect(team.cup).to eql team_category.cup}
      it {expect(team_category.cup.teams).to match_array [team]}
      it {expect(Team.empty.to_a).to include(team)}
      it {expect(Team.empty.to_a).to eq [team]}

      context "with 1 participation" do
        let(:kenshi) { create :kendocup_kenshi, dob: 20.years.ago, grade: "3Dan" }
        let!(:team_participation) {create :kendocup_participation, team_id: team.id, category: team_category, kenshi: kenshi}
        before {team.reload}
        it {expect(team).to be_valid_verbose}
        it {expect(team_participation.team).to eq team}
        it {expect(Team.incomplete.all).to include(team)}
        it {expect(Team.incomplete).to eq [team]}
        it {expect(team.participations.count).to eq 1}
        it {expect(team.fitness).to eq 0.15}
        it {expect(Team.empty.to_a).to_not include(team)}
      end

      context "with 5 participations" do
        before {
          5.times do |i|
            create :kendocup_participation, team: team, category: team_category, kenshi: create(:kendocup_kenshi, dob: 30.years.ago, grade: "#{i+1}Dan", cup: cup)
          end
          team.reload
        }
        # before {
        #   allow(team).to receive(:participations) { [mock_model(Participation),mock_model(Participation),mock_model(Participation),mock_model(Participation),mock_model(Participation)] }
        # }

        it {expect(team).to be_valid_verbose}
        it {expect(team).to be_complete}
        it {expect(team).to be_isvalid}
        it {expect(Team.complete.all).to include(team)}
        it {expect(team.participations.count).to eq 5}
        it {expect(team.fitness).to eq 0.4839}
      end

      context "with 4 participations" do
        before {
          4.times do
            create :kendocup_participation, team: team, category: team_category
          end
          team.reload
        }

        it {expect(team).to be_valid_verbose}
        it {expect(team).to be_incomplete}
        it {expect(team).to be_isvalid}
        it {expect(Team.incomplete.all).to include(team)}
        it {expect(team.participations.count).to eq 4}
      end

      context "with 6 participations" do
        before {
          6.times do
            create :kendocup_participation, team: team, category: team_category
          end
          team.reload
        }

        it {expect(team).to be_valid_verbose}
        it {expect(team).to be_complete}
        it {expect(team).to be_isvalid}
        it {expect(team.participations.count).to eq 6}
      end
    end
  end
end
