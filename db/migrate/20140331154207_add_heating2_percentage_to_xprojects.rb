class AddHeating2PercentageToXprojects < ActiveRecord::Migration
  def change
  	add_column :xprojects, :heating2_percentage, :integer
  	add_column :xprojects, :heating2_energy_source, :integer
  end
end
