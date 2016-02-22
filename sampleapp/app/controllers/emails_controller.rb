class EmailsController < ApplicationController
skip_before_filter  :verify_authenticity_token
	before_action :admin_user,          only: [:destroy]
	def index
		 @emails= Email.all
	end

	def new
		@email = Email.new
		@summary= Summary.all
	end

	def create
		@email = Email.new(email_params)
		if @email.save        	
        	flash[:success] = "New Email Testing Target created"
        	#redirect_to salesreps_path(@site)
        	redirect_to action: 'index'
    	else
        	render 'new'
    	end
	end

	def edit
		@email = Email.find(params[:id])
	end

	def update
		@email = Email.find(params[:id])

		if @email.update_attributes(email_params)
			flash[:success] = "Email Testing Target updated"
			redirect_to action: 'index'
		else
			render 'edit'
		end
	end





	def destroy
        Email.find(params[:id]).destroy
        flash[:success] = 'Email Testing Target Deleted'
        redirect_to emails_url
    end


	private
    def email_params
        params.require(:email).permit(:server_name, :imap, :imap_port, :smtp, :smtp_port, :account_name, :account_password, :sending_time, :receiving_time)
    end

    #Confirms an admin user.
    def admin_user
        redirect_to(root_url) unless current_user.admin?
    end
end

