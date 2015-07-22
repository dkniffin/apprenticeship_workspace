class CoinChanger
	def make_change(amount)
		change = []
		[25,10,5,1].each do |coin|
			num,amount = amount.divmod(coin)
			num.times { change.push(coin) }
		end
		change
	end
end
