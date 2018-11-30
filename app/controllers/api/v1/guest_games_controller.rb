class Api::V1::GuestGamesController < ApplicationController

    def index
        @guest_games = GuestGame.all
        render json: @guest_games
    end

    def show 
        @guest_game = GuestGame.find(params[:id])
        render json: @guest_game
    end

    def create
        @guest_game = GuestGame.create(guest_game_params)
        if @guest_game.valid?
            render json: @guest_game
        else
            render json: {error: 'Error - Unable creat Guest Game.'}, status: 400
        end
    end

    private

    def guest_game_params
        params.require(:guest_game).permit(:canvas, :name)
    end
end
