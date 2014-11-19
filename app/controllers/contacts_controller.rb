class ContactsController < ApplicationController
	def index
		@contacts = Contact.all
	end

	def new
		@contact = Contact.new
	end

	def create
		@contact = Contact.new
		@contact.name = params[:name]
		@contact.email = params[:email]
		@contact.phone = params[:phone]
		if @contact.save
			redirect_to root_path
		else
			flash[:error] = "Oops, invalid values!"
			render :new
		end
	end

	def update
		@contact = Contact.find(params[:id])
		@contact.email = params[:email]
		@contact.phone = params[:phone]
		if @contact.save
			render :json => {
				email: @contact.email,
				phone: @contact.phone,
				avatar_url: @contact.avatar_url
			}
		else
			render :nothing => true, :status => 400
		end
	end

	def delete
		@contact = Contact.find(params[:id])
		@contact.delete
		render :json => {status: 1}
	end
end
