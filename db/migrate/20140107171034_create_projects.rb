class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
    	t.integer :user_id
    	t.integer :expert_id
    	t.string :name
      t.string :building_address
      t.string :building_zip_code
      t.string :building_town
    	t.string :construction_period
      t.string :construction_year
    	t.string :project_type
    	t.decimal :area, :precision => 10, :scale => 2
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
      t.integer :lighting_power
    	t.decimal :contracted_power, :precision => 10, :scale => 2
    	t.integer :electricity_consumption
      t.integer :gas_consumption
      t.integer :gasoil_consumption
      t.boolean :other_energy_sources
    	t.string :energy_class_guess
    	t.string :energy_class
      ## User info
      t.string :user_first_name
      t.string :user_surname1
      t.string :user_surname2
      t.string :user_id_document_type
      t.string :user_id_document_number
      t.string :user_telephone
      t.string :user_mobile_phone
      t.string :user_email
      t.string :user_address
      t.string :user_zip_code
      t.string :user_town
      t.timestamps
    end
  end
end
