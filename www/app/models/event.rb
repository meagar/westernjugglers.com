class Event < ActiveRecord::Base

	validates_length_of :name, :within => 1..50 
	validates_length_of :location, :within => 1..100

end
