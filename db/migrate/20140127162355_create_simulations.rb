class CreateSimulations < ActiveRecord::Migration
  def change
    create_table :simulations do |t|
    	t.integer :construction_period
    	t.integer :hot_water_type
    	t.string :energy_class
      t.timestamps
    end
  end
end
