class CreateTowns < ActiveRecord::Migration
	def change
		create_table :towns do |t|
			t.string :name
			t.string :region
			t.string :province
			t.string :altitude
			t.string :climatic_zone
			t.timestamps
		end
	end
end
