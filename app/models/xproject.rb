class Xproject < ActiveRecord::Base

	belongs_to :expert
	has_many :improvements

end
