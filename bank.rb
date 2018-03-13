class Bank
  attr_accessor :player_bank, :dealer_bank, :game_bank

  def initialize
    @player_bank = 100
    @dealer_bank = 100
    @game_bank = 0
  end

  def start_game
    @player_bank -= 10
    @dealer_bank -= 10
    @game_bank += 20
  end
end
