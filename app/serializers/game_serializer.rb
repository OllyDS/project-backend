class GameSerializer < ActiveModel::Serializer
  attributes :id, :current_guesser, :word, :canvas, :win_streak, :lives, :users
  has_many :user_games
  has_many :users, through: :user_games
  class UserSerializer < ActiveModel::Serializer
    attributes :id, :username, :first_name, :last_name
  end
end
