class MarkersController < ApplicationController

	def index

		# if we have a search query, find Markers near that search query
		# otherwise show all pubs
		#@markers = Marker.all

		if params[:search].present?
			# find Markers near the search query
			@markers = Marker.near(params[:search])
		else
			# show all the markers in name order
			@markers = Marker.order("title asc")
		end

	end


	def new
		@marker = Marker.new
	end

	def create
		@marker = Marker.new(marker_params)

		if @marker.save
			redirect_to root_path
		else
			render "new"
		end

	end



	# for deleting markers
	def destroy
		@marker = Marker.find(params[:id])
		@marker.destroy
		redirect_to root_path
	end









	# this is the whitelisted params
	def marker_params
		params.require(:marker).permit(:title, :location, :latitude, :longitude)
	end

end
