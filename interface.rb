class Interface
  def ask_for_number(message)
    puts message
    gets.chomp.to_i
  end

  def ask_for_string(message)
    puts message
    gets.chomp.to_s
  end

  def round_info(player, dealer)
    puts player.deck
    puts "Player summary #{player.deck.sum}"
    puts dealer.deck
    puts "Dealer summary #{dealer.deck.sum}"
  end

  def bank_info(player_bank)
    puts "Your bank is $#{player_bank}"
  end

  def player_sum(player)
    puts player.deck
    puts "Player summary: #{player.deck.sum}"
  end
end
