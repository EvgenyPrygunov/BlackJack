module WinModule
  def player_win_check
    if @player.hand.sum > 21
      puts 'Dealer WIN!'
      @bank.dealer_bank += 20
    elsif @dealer.hand.sum > 21 || (@player.hand.sum > @dealer.hand.sum)
      puts "Player #{@player.name} WIN!"
      @bank.player_bank += 20
    end
  end

  def dealer_win_check
    if @dealer.hand.sum > 21 && @player.hand.sum <= 21
      puts "Player #{@player.name} WIN!"
      @bank.player_bank += 20
    elsif @player.hand.sum > 21 || (@dealer.hand.sum > @player.hand.sum)
      puts 'Dealer WIN!'
      @bank.dealer_bank += 20
    end
  end

  def draw_check
    return unless @player.hand.sum == @dealer.hand.sum
    puts 'DRAW!'
    @bank.player_bank += 10
    @bank.dealer_bank += 10
  end
end
