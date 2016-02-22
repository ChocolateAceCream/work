class Api::V1::EmailsController < ApplicationController
  def index
  	@email = Email.all
    @reply =[]
    @email.each do |email|
      @reply<< [email.id, email.server_name,email.imap, email.imap_port, email.smtp, email.smtp_port, email.account_name, email.account_password]
    end
    respond_to do |format|
        format.json { render :json => @reply}
    end
  end


  def show
    @email = Email.all
    @reply =[]
    @email.each do |email|
      @reply << [email.server_name, email.sending_time, email.receiving_time,email.updated_at]
    end
	  respond_to do |format|
	      format.json { render :json => @reply}
	    end
  end

end