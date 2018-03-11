module DealerModule
  def dealer_cards
    @dealer.cards.each { puts '*' }
  end

  def dealer_cards_endgame
    puts 'Dealer cards:'
    @dealer.cards.each { |card| puts "#{card[0]}#{card[1]}" }
    puts "Summary: #{summary(@dealer)}"
  end

  def dealer_turn
    @current_turn = 0
    if summary(@dealer) >= 17 || full?(@dealer)
      puts 'Dealer stand. Your turn.'
      player_turn
    elsif summary(@dealer) < 17
      take_card_dealer
    end
    player_turn
  end

  def take_card_dealer
    end_game_check
    if @current_turn.zero? && full?(@dealer)
      player_turn
    elsif @current_turn.zero?
      @dealer.cards << @deck.add_card
    end
  end
end
