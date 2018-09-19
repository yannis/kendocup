require "translate"
module Kendocup
  class Product < ActiveRecord::Base
    belongs_to :cup
    belongs_to :event
    has_many :purchases, dependent: :destroy, autosave: true
    has_many :kenshis, through: :purchases

    validates_presence_of :cup_id
    validates_presence_of :name_en
    validates_presence_of :name_fr
    validates_presence_of :name_de
    validates_uniqueness_of :name_en, scope: :cup_id
    validates_uniqueness_of :name_fr, scope: :cup_id
    validates_uniqueness_of :name_de, scope: :cup_id
    validates_presence_of :fee_chf
    validates_presence_of :fee_eu
    validates_numericality_of :fee_chf, allow_nil: true
    validates_numericality_of :fee_eu, allow_nil: true

    translate :name, :description

    delegate :year,to: :cup
  end
end
