FactoryGirl.define do
  factory :kendocup_team, :class => 'Kendocup::Team' do
    name { 'team_name_' + Faker::Company.name + rand(1000) }
  end
end
