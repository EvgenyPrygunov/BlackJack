module PlayerModule
  def player_name
    puts 'Hello! What is your name?'
    name = gets.chomp.to_s
    @player = Player.new(name)
  end

  def player_cards
    puts "#{@player.name}, your cards:"
    @player.cards.each { |card| puts "#{card[0]}#{card[1]}" }
    puts "Summary: #{@deck.sum(@player)}"
  end

  def player_turn
    @current_turn = 1
    puts 'Enter your choice: 1 - stand, 2 - take card, 3 - face up (open cards)'
    input = gets.chomp.to_i
    send @choice[input]
  end

  def take_card_player
    end_game_check
    if @current_turn == 1 && @deck.full?(@player)
      face_up
    elsif @current_turn == 1
      @player.cards << @deck.add_card
      player_cards
      dealer_turn
    end
  end
end
