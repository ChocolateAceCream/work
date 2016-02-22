class SummariesController < ApplicationController
	before_action :admin_user,          only: [:destroy, :edit, :update]
	def index
		 @user= current_user
		 if current_user.admin?
		 	@summaries= Summary.all
		 else
		 	@summaries= @user.summaries
		 end
	end

	def new
		@summary = Summary.new
		@user = current_user
		@sites = Site.all
		@emails = Email.all
	end

	def create
		@summary = Summary.new(summary_params)

		@sites = Site.where(:id => params[:selected_site])
		@summary.sites << @sites

		@emails = Email.where(:id => params[:selected_email])
		@summary.emails << @emails

		@users = User.where(:id => params[:selected_user])
		@summary.users << @users
		if @summary.save        	
        	flash[:success] = "Summary created"
        	redirect_to action: 'index'
    	else
        	render 'new'
    	end
	end

	def edit
		@summary = Summary.find(params[:id])
		@sites = Site.all
	end

	def update
		@summary = Summary.find(params[:id])

		@sites = Site.where(:id => params[:selected_site])
		@summary.sites.destroy_all
		@summary.sites << @sites

		@emails = Email.where(:id => params[:selected_email])
		@summary.emails.destroy_all
		@summary.emails << @emails

		@users = User.where(:id => params[:selected_user])
		@summary.users.destroy_all
		@summary.users << @users

		if @summary.update_attributes(summary_params)
			flash[:success] = "Summary updated"
			redirect_to action: 'index'
		else
			render 'edit'
		end
	end

	def display
        @summary = Summary.find(params[:id])
        @sites = @summary.sites
        @emails = @summary.emails

    end

    def destroy
        Summary.find(params[:id]).destroy
        flash[:success] = 'Summary deleted'
        redirect_to summaries_url
    end

	private
    def summary_params
        params.require(:summary).permit(:name, :description)
    end

    #Confirms an admin user.
    def admin_user
        redirect_to(root_url) unless current_user.admin?
    end
end
