#start new game
require_relative 'bank'
require_relative 'dealer'
require_relative 'deck'
require_relative 'interface'
require_relative 'logic'
require_relative 'player'

game = Logic.new

game.start
