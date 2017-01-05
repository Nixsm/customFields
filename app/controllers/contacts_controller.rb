class ContactsController < ApplicationController
  def new
    @user = User.find(params[:user_id])

  end

  def create
    @user = User.find(params[:user_id])

    @user.contacts ||= []

    contact_params = params[:contact]

    contact = Contact.new

    contact_params.each do |param, value|
      contact[param] = value
    end

    @user.contacts.push(contact)

    if @user.save
      redirect_to @user and return
    end

    render 'new'
  end
end
