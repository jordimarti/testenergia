class CreateAutotests < ActiveRecord::Migration
  def change
    create_table :autotests do |t|
    	t.string :building_town
    	t.string :construction_period
      t.string :construction_year
    	t.string :project_type
    	t.string :facade_improvements
    	t.string :roof_improvements
    	t.string :window_type
    	t.string :window_tightness
    	t.string :hot_water_type
      t.string :hot_water_age
      t.string :heating_age
    	t.string :cooling_type
    	t.string :cooling_age
      t.string :lighting_type
      t.string :energy_class_guess
      t.timestamps
    end
  end
end
