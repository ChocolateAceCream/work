class SalesrepsController < ApplicationController
	def index
		 @salesreps= Salesrep.all
	end

	def new
		@salesrep = Salesrep.new
		@territory= Territory.all
	end

	def create
		@salesrep = Salesrep.new(salesrep_params)
		if @salesrep.save        	
        	flash[:success] = "Sales reps created"
        	#redirect_to salesreps_path(@salesrep)
        	redirect_to action: 'index'
    	else
        	render 'new'
    	end
	end

	def edit
		@salesrep = Salesrep.find(params[:id])
	end

	def update
		@salesrep = Salesrep.find(params[:id])

		if @salesrep.update_attributes(salesrep_params)
			flash[:success] = "Sales rep updated"
			redirect_to action: 'index'
		else
			render 'edit'
		end
	end

	def display
        @salesrep = Salesrep.find(params[:id])
        @customers = Customer.all.select {|i| i.salesrepnumber == @salesrep.sales_rep_number }        			 		 
        
    end

	private
    def salesrep_params
        params.require(:salesrep).permit(:territorynumber,:sales_rep_number, :sales_rep_name, :address, :city, :state, :zip, :mtd_sales, :ytd_sales, :mtd_commission, :ytd_commission, :commission_rate)
    end

end
