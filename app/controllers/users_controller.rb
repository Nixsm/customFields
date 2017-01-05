class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])

  end

  def new
    @user = User.new
  end

  def create
    # create a new user
    @user = User.new(user_params)
    # save it to the database
    if @user.save
      # and redirect to user screen
      redirect_to @user, notice: "#{@user.name} has been registred!" and return
    end

    render 'new'
  end

  private
    # define a helper function to get the parameters
    def user_params
      params.require(:user).permit(:name, :pass)
    end
end
