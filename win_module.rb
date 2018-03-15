module WinModule
  def player_win_check
    if @player.deck.sum > 21
      puts 'Dealer WIN!'
      @bank.dealer_bank += 20
    elsif @dealer.deck.sum > 21 || (@player.deck.sum > @dealer.deck.sum)
      puts "Player #{@player.name} WIN!"
      @bank.player_bank += 20
    end
  end

  def dealer_win_check
    if @dealer.deck.sum > 21 && @player.deck.sum <= 21
      puts "Player #{@player.name} WIN!"
      @bank.player_bank += 20
    elsif @player.deck.sum > 21 || (@dealer.deck.sum > @player.deck.sum)
      puts 'Dealer WIN!'
      @bank.dealer_bank += 20
    end
  end

  def draw_check
    return unless @player.deck.sum == @dealer.deck.sum
    puts 'DRAW!'
    @bank.player_bank += 10
    @bank.dealer_bank += 10
  end
end
