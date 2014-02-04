class CreateImprovements < ActiveRecord::Migration
  def change
    create_table :improvements do |t|
    	t.integer :xproject_id
    	t.string :name
    	t.text :description
      t.integer :cost
    	t.integer :savings
    	t.integer :roi
      t.timestamps
    end
  end
end
