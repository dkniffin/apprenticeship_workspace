module TicTacToe
	class AI
		attr_reader :token, :playerToken
		def initialize(token, playerToken)
			@token = token
			@playerToken = playerToken
		end
	end
end
