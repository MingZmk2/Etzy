class Api::UsersController < ApplicationController
    wrap_parameters include: User.attribute_names + ['password']  
    before_action :require_logged_out, only: [:create]

    def create
        @user = User.new(user_params)

        if @user.save
            login(@user)
            render :show, status: :created
        else
            # render json: @user.errors.full_messages, status: :unprocessable_entity
            render json: { 
                email: @user.errors[:email], 
                password: @user.errors[:password], 
                first_name: @user.errors[:first_name] 
                }, 
                status: :unprocessable_entity
        end
    end
    
    private

    def user_params
        params.require(:user).permit(:first_name, :email, :password)
    end
end