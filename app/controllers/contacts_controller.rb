class ContactsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
  end

  def create
    @user = User.find(params[:user_id])

    # Initialize contacts if we dont have any
    @user.contacts ||= []

    contact_params = params[:contact]

    # Create a new contact
    contact = Contact.new

    # for each param add it to the contact
    contact_params.each do |param, value|
      contact[param] = value
    end

    # add the contact to the user
    @user.contacts.push(contact)

    # save the user to the db and redirect to user screen
    if @user.save
      redirect_to @user and return
    end

    render 'new'
  end
end
