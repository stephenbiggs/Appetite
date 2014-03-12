class Marker < ActiveRecord::Base

	validates :title, presence: true
	validates :location, presence: true

	# instead of letting users put in co-ordinates
	# make geocoder do it for us

	# we want to geocode by the location
	geocoded_by :location
	after_validation :geocode
	

end
