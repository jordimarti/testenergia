class CreateDefaultImprovements < ActiveRecord::Migration
  def change
    create_table :default_improvements do |t|
    	t.string :name
      t.text :description
      t.integer :measure_type
      t.integer :cost
      t.integer :energy_savings
      t.integer :emissions_savings
      t.integer :economic_savings
      t.integer :roi
      t.integer :difficulty
      t.integer :better_comfort
      t.integer :better_healthiness
      t.integer :better_security
      t.integer :less_noise
      t.integer :less_airflow
      t.integer :less_moisture
      t.integer :less_maintenance
      t.integer :water_savings
      t.timestamps
    end
  end
end
