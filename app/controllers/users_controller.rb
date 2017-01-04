class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to login_url, notice: "#{@user.name} has been registred!" and return
    end

    render 'new'
  end

  private
    def user_params
      params.require(:user).permit(:name, :pass)
    end
end