class SessionsController < ApplicationController
  def new

  end

  def create
    # check if our user exists
    user = User.find_by(name: params[:session][:name].downcase)
    # if so, check the password and redirect to user screen
    if user && user.pass == params[:session][:pass]
      redirect_to user and return
    end

    render 'new'
  end
end
