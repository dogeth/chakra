class Chakra < ActiveRecord::Base
  has_many :goddesses, :order => :number
  
  validates_presence_of :name, :description, :colour

end
