class CreateBuildings < ActiveRecord::Migration
  def change
    create_table :buildings do |t|
    	t.integer :user_id
    	t.string :name
    	t.string :address
    	t.decimal :area, :precision => 10, :scale => 2
      t.timestamps
    end
  end
end
