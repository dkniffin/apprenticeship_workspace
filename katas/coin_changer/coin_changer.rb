class CoinChanger
  def make_change(amount)
    make_change_divmod(amount)
  end
  def make_change_subtraction(amount)
    change = []
    [25,10,5,1].each do |coin|
      while (amount / coin) > 0 && amount > 0
        amount -= coin
        change.push(coin)
      end
    end
    change
  end
  def make_change_divmod(amount)
		change = []
		[25,10,5,1].each do |coin|
			num,amount = amount.divmod(coin)
			num.times { change.push(coin) }
		end
		change
	end
end
