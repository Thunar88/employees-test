class SessionsController < ApplicationController
  skip_before_action :authorize, only: %i[new create]

  def new; end

  def create
    user = User.find_by_login(params[:login])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to employees_url, notice: 'Logged in!'
    else
      flash.now[:alert] = 'Login or password is invalid'
      render :new
    end
  end

  def destroy
    session.delete(:user_id)
    @current_user = nil
    redirect_to root_url, notice: 'Logged out!'
  end

  private

  def session_params
    params.require(:user).permit(:login, :password)
  end
end
