FactoryGirl.define do
  factory :kendocup_cup, :class => 'Kendocup::Cup' do
    start_on {rand(Date.civil(Date.current.year+1, 1, 1)..Date.civil(Date.current.year+10, 12, 31))}
    deadline {|c|
      return nil if c.start_on.blank?
      start = Date.parse(c.start_on.to_s)
      start-14.days
    }
    adult_fees_chf {30}
    adult_fees_eur {25}
    junior_fees_chf {16}
    junior_fees_eur {14}
  end
end
