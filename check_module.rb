module CheckModule
  def auto_face_up_check
    face_up if @player.deck.full? && @dealer.deck.full?
  end

  def player_check
    name = @int.ask_for_string('Hello! What is your name?')
    @player = Player.new(Deck.new, name)
  end

  def bank_check
    if @bank.player_bank <= 0
      puts "Player #{@player.name} has lost the whole game!"
      new_game
    elsif @bank.dealer_bank <= 0
      puts "Player #{@player.name} has won the whole game!"
      new_game
    end
  end
end
