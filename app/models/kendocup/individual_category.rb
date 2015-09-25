require "kendocup/acts_as_category"
module Kendocup
  class IndividualCategory < ActiveRecord::Base

    acts_as_category

    belongs_to :cup, inverse_of: :individual_categories
    has_many :participations, as: :category, dependent: :destroy # inverse_of not working with polymorphic associations
    has_many :kenshis, through: :participations

    delegate :year, to: :cup


    def full_name
      "#{self.name} (#{self.cup.year})"
    end
  end
end
