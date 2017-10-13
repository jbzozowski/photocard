class UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to thanks_card_path(params[:user][:card_id])
    else
      redirect_to deliver_card_path(params[:user][:card_id])
    end
  end

private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
