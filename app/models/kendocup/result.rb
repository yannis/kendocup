module Kendocup
  class Result < ActiveRecord::Base
    RESULT_NAMES = ["1", "2", "3", "Fighting spirit"]

    belongs_to :kenshi
    belongs_to :category, polymorphic: true

    validates_presence_of :kenshi, inverse_of: :results

    validates_inclusion_of :name, in: RESULT_NAMES
  end
end
