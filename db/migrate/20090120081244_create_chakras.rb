class CreateChakras < ActiveRecord::Migration
  def self.up
    create_table :chakras do |t|

      t.string :name

      t.string :description


      t.timestamps

    end

	add_index :chakras, :name

  end

  def self.down
    drop_table :chakras
  end
end
