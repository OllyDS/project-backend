class Api::V1::GamesController < ApplicationController
    
    def index
        @users = User.all
        render json: @users
    end
  
    def show
        @user = User.find(params[:id])
        render json: @user
    end

    def create
        @user = User.create(user_params)
        if @user.valid?
            render json: @user
        else
            render json: {error: 'Error - Unable to create Game.'}, status: 400
        end
    end

    def update
        if @game.update(game_params.valid?)
            render json: @game
        else
            render json: {error: 'Error - Unable to update Game.'}, status: 400
        end
    end

    def destroy
        @game = Game.find(params[:id])
        if @game
            @game.destroy
            render json: {message: "Playlist Song successfully deleted."}
        else
            render json: {error: "Unable to delete Game"}, status: 400
        end
    end
  
    private

    def user_params
    params.require(:user).permit(:canvas, :lives, :win_streak)
    end
  
  
end # End of the Controller
