class CreateGoddesses < ActiveRecord::Migration
  def self.up
    create_table :goddesses do |t|

	  t.references :chakra
	  
      t.string :name

      t.integer :number

      t.string :description

      t.string :tag

      t.string :modern_energy, :limit => 500

      t.string :do_this, :limit => 500


      t.timestamps

    end
    
	add_index :goddesses, :name
	add_index :goddesses, :number

  end

  def self.down
    drop_table :goddesses
  end
end
