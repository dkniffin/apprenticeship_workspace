require_relative 'quarter'
require_relative 'dime'
require_relative 'nickel'
require_relative 'penny'

module Kata
  class CoinChanger
    def make_change(amount)
      change = []
      coins = [Quarter,Dime,Nickel,Penny]
      coins.each do |coin|
        while (amount / coin.value) > 0 && amount > 0
          amount -= coin.value
          change.push(coin.value)
        end
      end
      change
    end
  end
end
