class Goddess < ActiveRecord::Base
  belongs_to :chakra
  
  validates_presence_of :chakra, :name, :number, :description, :modern_energy, :do_this
  validates_numericality_of :number, :only_integer => true

end
