class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(user_params[:email],user_params[:password])
      redirect_to quizzes_path, notice: 'Signed up!'
    else
      flash[:error] = 'Email or password was invalid'
      redirect_to :back
    end
  end

  private

  def user_params
    params.require(:user).permit(:name,
                                 :email,
                                 :password
    )
  end


end
