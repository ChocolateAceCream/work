class TerritoriesController < ApplicationController
	
	def index
		 @territories = Territory.all
	end

	def new
		@territory = Territory.new
	end

	def create
		@territory = Territory.new(territory_params)
		if @territory.save        	
        	flash[:success] = "Territory created"
        	#redirect_to territories_path(@territory)
        	redirect_to action: 'index'
    	else
        	render 'new'
    	end
	end

	def edit
		@territory = Territory.find(params[:id])
	end

	# @return [Object]
	def update
		@territory = Territory.find(params[:id])

		if @territory.update_attributes(territory_params)
			flash[:success] = "Territory updated"
			redirect_to action: 'index'
		else
			render 'edit'
		end
	end

	def display
        @territory = Territory.find(params[:id])
        @salesreps = Salesrep.all.select {|i| i.territorynumber == @territory.number }        			 		 
        
    end
	
	private
    def territory_params
        params.require(:territory).permit(:name, :number)
    end
end
