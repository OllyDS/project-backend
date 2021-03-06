class Api::V1::UsersController < ApplicationController

    def index
      @users = User.all
      render json: @users
    end

    def show
        @user = User.find(params[:id])
        render json: @user
    end
  
    def login
      @user = User.find_by(username: params[:username])
      if @user && @user.authenticate(params[:password])
        render json: {username: @user.username, token: issue_token({id: @user.id}), id: @user.id}
      else
        render json: {error: 'Username/password invalid.'}, status: 401
      end
    end
  
    def validate
      @user = get_current_user
      if @user
       render json: {username: @user.username, token: issue_token({id: @user.id})}
      else
        render json: {error: 'Username/password invalid.'}, status: 401
     end
    end

    def create
        @user = User.new(user_params)
        if @user.save
            render json: @user
        else
            render json: {error: 'Error - Unable to create User.'}, status: 400
        end
    end

    private

    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation, :first_name, :last_name)
    end


  end # End of the Controller