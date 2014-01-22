class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
    	t.integer :user_id
    	t.integer :expert_id
    	t.string :name
    	t.string :region
    	t.string :address
    	t.string :cadastre
    	t.string :construction_period
    	t.string :project_type
    	t.decimal :area, :precision => 10, :scale => 2
    	t.string :facade_improvements
    	t.string :roof_improvements
    	t.string :window_type
    	t.string :window_improvements
    	t.string :hot_water_type
    	t.string :hot_water_improvements
    	t.string :heating_type
    	t.string :heating_improvements
    	t.string :cooling_type
    	t.string :cooling_improvements
    	t.decimal :contracted_power, :precision => 10, :scale => 2
    	t.integer :refrigerator_power
    	t.integer :microwave_power
    	t.integer :washingmachine_power
    	t.integer :dishwasher_power
    	t.integer :oven_power
    	t.integer :vitroceramic_power
    	t.integer :tv_power
    	t.integer :pc_power
    	t.integer :stereo_power
    	t.integer :coffeemachine_power
    	t.string :lighting_type
    	t.string :lighting_improvements
    	t.integer :lighting_power
    	t.string :ventilation_type
    	t.string :solarprotection_type
    	t.string :maintenance_type
    	t.string :energy_class_guess
    	t.string :energy_class
        t.string :electricity_consumption
        t.string :gas_consumption
        t.string :gasoil_consumption
        t.timestamps
    end
  end
end
