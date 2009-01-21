class DataLoad < ActiveRecord::Migration
  def self.up
  		c = Chakra.create :name => "A", :description => "ADesc"
  		
  		Goddess.create :chakra => c, :name => "G1", :number => 1, :description => "G1Desc", :tag => "G1Tag", :modern_energy => "G1ME", :do_this => "G1DT"
  		Goddess.create :chakra => c, :name => "G2", :number => 2, :description => "G2Desc", :tag => "G2Tag", :modern_energy => "G2ME", :do_this => "G2DT"


  		c = Chakra.create :name => "B", :description => "BDesc"
  		Goddess.create :chakra => c, :name => "G3", :number => 3, :description => "G3Desc", :tag => "G3Tag", :modern_energy => "G3ME", :do_this => "G3DT"
  		Goddess.create :chakra => c, :name => "G4", :number => 4, :description => "G4Desc", :tag => "G4Tag", :modern_energy => "G4ME", :do_this => "G4DT"

  end

  def self.down
	    Goddess.destroy_all
    	Chakra.destroy_all
  end
end
