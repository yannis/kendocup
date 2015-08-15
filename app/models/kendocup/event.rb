require "translate"
module Kendocup
  class Event < ActiveRecord::Base
    belongs_to :cup

    validates_presence_of :cup_id
    validates_presence_of :name_en
    validates_presence_of :name_fr
    validates_presence_of :name_de
    validates_presence_of :start_on

    translate :name
  end
end
