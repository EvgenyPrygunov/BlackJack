module WinCheckModule
  def player_win_check
    if @deck.sum(@player) > 21
      puts 'Dealer WIN!'
      @bank.dealer_bank += 20
    elsif @deck.sum(@dealer) > 21 || (@deck.sum(@player) > @deck.sum(@dealer))
      puts "Player #{@player.name} WIN!"
      @bank.player_bank += 20
    end
  end

  def dealer_win_check
    if @deck.sum(@dealer) > 21 && @deck.sum(@player) <= 21
      puts "Player #{@player.name} WIN!"
      @bank.player_bank += 20
    elsif @deck.sum(@player) > 21 || (@deck.sum(@dealer) > @deck.sum(@player))
      puts 'Dealer WIN!'
      @bank.dealer_bank += 20
    end
  end

  def draw_check
    return unless @deck.sum(@player) == @deck.sum(@dealer)
    puts 'DRAW!'
    @bank.player_bank += 10
    @bank.dealer_bank += 10
  end
end
