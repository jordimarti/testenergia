class Building < ActiveRecord::Base

	belongs_to :user

	validates_presence_of :name
	validates_length_of :name, :maximum => 10

end
