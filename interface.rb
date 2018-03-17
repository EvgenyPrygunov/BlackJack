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
    puts player.hand
    puts "Player summary #{player.hand.sum}"
    puts dealer.hand
    puts "Dealer summary #{dealer.hand.sum}"
  end

  def bank_info(player_bank)
    puts "Your bank is $#{player_bank}"
  end

  def player_sum(player)
    puts player.hand
    puts "Player summary: #{player.hand.sum}"
  end
end
