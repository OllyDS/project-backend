class Api::V1::UserGamesController < ApplicationController

    def index
        @user_games = UserGame.all
        render json: @user_games
    end
  
    def show
        @user_game = UserGame.find(params[:id])
        render json: @user_game
    end

    def create
        @user_game = UserGame.create(user_game_params)
        if @user_game.valid?
            render json: @user_game
        else
            render json: {error: 'Error - Unable to create UserGame.'}, status: 400
        end
    end

end # End of the Controller
