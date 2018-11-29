class Game < ApplicationRecord
    has_many :users, through: :user_games
end
