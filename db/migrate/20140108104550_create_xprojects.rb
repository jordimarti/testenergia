class CreateXprojects < ActiveRecord::Migration
  def change
    create_table :xprojects do |t|
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
      t.string :cadastre
      t.string :facade_improvements
      t.string :roof_improvements
      t.string :window_type
      t.string :window_tightness
      t.string :facade_definition
      t.integer :facade_score
      t.string :roof_definition
      t.integer :roof_score
      t.string :floor_definition
      t.integer :floor_score
      t.string :windows_definition
      t.integer :windows_score
      t.string :hot_water_type
      t.string :hot_water_age
      t.string :hot_water_definition
      t.integer :hot_water_score
      t.string :heating_age
      t.string :heating_definition
      t.integer :heating_score
      t.string :cooling_type
      t.string :cooling_age
      t.string :cooling_definition
      t.integer :cooling_score
      t.string :lighting_type
      t.integer :lighting_power
      t.string :lighting_definition
      t.integer :lighting_score
      t.decimal :contracted_power, :precision => 10, :scale => 2
      t.string :appliances_definition
      t.integer :appliances_score
      t.integer :electricity_consumption
      t.decimal :electricity_price, :precision => 10, :scale => 2
      t.decimal :electricity_emissions, :precision => 10, :scale => 2
      t.integer :electricity_consumption_improvements
      t.integer :gas_consumption
      t.decimal :gas_price, :precision => 10, :scale => 2
      t.decimal :gas_emissions, :precision => 10, :scale => 2
      t.integer :gas_consumption_improvements
      t.integer :gasoil_consumption
      t.decimal :gasoil_price, :precision => 10, :scale => 2
      t.decimal :gasoil_emissions, :precision => 10, :scale => 2
      t.integer :gasoil_consumption_improvements
      t.boolean :other_energy_sources
      t.string :energy_class_guess
      t.string :energy_class
      t.decimal :global_emissions, :precision => 10, :scale => 2
      t.string :global_emissions_rating
      t.decimal :global_primary_energy, :precision => 10, :scale => 2
      t.string :global_primary_energy_rating
      t.integer :total_energy_consumption
      t.integer :total_energy_consumption_improvements
      t.integer :heating_percentage
      t.integer :heating_energy_source
      t.integer :cooling_percentage
      t.integer :cooling_energy_source
      t.integer :hot_water_percentage
      t.integer :hot_water_energy_source
      t.integer :lighting_percentage
      t.integer :appliances_percentage
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
