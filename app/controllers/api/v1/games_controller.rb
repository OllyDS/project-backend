class Api::V1::GamesController < ApplicationController
    
    def index
        @games = Game.all
        render json: @games
    end
  
    def show
        @game = Game.find(params[:id])
        render json: @game
    end

    def create
        @game = Game.create(game_params)
        if @game.valid?
            render json: @game
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
            render json: {message: "Game successfully deleted."}
        else
            render json: {error: "Unable to delete Game"}, status: 400
        end
    end
  
    private

    def game_params
    params.require(:game).permit(:canvas, :word, :lives, :win_streak, :current_guesser)
    end
  
  
end # End of the Controller
