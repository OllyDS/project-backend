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

    def update
        @user_game = UserGame.find(params[:id])
        if @user_game
            @user_game.update(user_game_params)
            render json: @user_game
        else
            render json: {Error: 'Error - Unable to update UserGame'}, status: 400
        end
    end

    private

    def user_game_params
      params.require(:user_game).permit(:user_id, :game_id, :artist, :lives)
    end


end # End of the Controller
