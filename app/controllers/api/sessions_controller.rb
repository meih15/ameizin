class Api::SessionsController < ApplicationController
  def show
    @user = current_user
    if @user
      render 'api/users/show'
    else
      render json: {user: nil}
    end
  end

  def create
    @user = User.find_by_credentials(params[:credential], params[:password])
    if @user 
      login!(@user)
      render 'api/users/show'
    else
      if User.find_by(email: params[:credential])
        render json: { errors: ['Your password is incorrect.'] }, status: :unauthorized
      else
        render json: { errors: ['We cannot find an account with that email address.']}, status: :unauthorized
      end
    end
  end

  def destroy
    logout! if current_user
    render json: ['successfully logged out']
  end
end
