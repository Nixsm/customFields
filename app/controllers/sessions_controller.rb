class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(name: params[:session][:name].downcase)
    if user && user.pass == params[:session][:pass]
      log_in user
      redirect_to user and return
    end

    render 'new'
  end

  def destroy

  end
end
