class CoinChanger
  def make_change(amount)
    change = []
    [25,10,5,1].each do |coin|
      while (amount / coin) > 0 && amount > 0
        amount -= coin
        change.push(coin)
      end
    end
    change
  end
end
