class CreateBuildingSystems < ActiveRecord::Migration
  def change
    create_table :building_systems do |t|
    	t.string :name
    	t.string :system_type
    	t.integer :score
    	t.string :thickness
    	t.integer	:before1800
    	t.integer :y1800
    	t.integer :y1810
    	t.integer :y1820
    	t.integer :y1830
    	t.integer :y1840
    	t.integer :y1850
    	t.integer :y1860
    	t.integer :y1870
    	t.integer :y1880
    	t.integer :y1890
    	t.integer :y1900
    	t.integer :y1910
    	t.integer :y1920
    	t.integer :y1930
    	t.integer :y1940
    	t.integer :y1950
    	t.integer :y1960
    	t.integer :y1970
    	t.integer :y1980
    	t.integer :y1990
    	t.integer :y2000
    	t.integer :y2010
      t.timestamps
    end
  end
end
