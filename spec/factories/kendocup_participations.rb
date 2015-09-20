FactoryGirl.define do
  factory :kendocup_participation, :class => 'Kendocup::Participation' do
    category { create :kendocup_individual_category}
    kenshi {|p| create :kendocup_kenshi, cup: p.category.cup}
  end
end
