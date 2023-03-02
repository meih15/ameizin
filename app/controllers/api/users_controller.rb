class Api::UsersController < ApplicationController
  wrap_parameters include: User.attribute_names + ['password']

  def create
    @user = User.new(user_params)
    
    if @user.save
        login!(@user)
        if @user.cart == nil
            user_cart = Cart.create
            @user.cart = user_cart
        end
        render :show
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :user_name, :password)
  end
end
