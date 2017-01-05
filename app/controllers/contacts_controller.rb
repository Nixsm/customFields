class ContactsController < ApplicationController
  def show
  end

  def new
    @user = User.find(params[:user_id])

  end

  def create
    @user = User.find(params[:user_id])

    @user.contacts ||=

    contact_params = params[:contact]

    contact = Contact.new

    contact_params.each do |param, value|
      contact[param] = value
    end



    render plain: contact.inspect
  end
end
