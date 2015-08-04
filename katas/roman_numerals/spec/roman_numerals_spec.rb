require_relative '../roman_numerals'

describe RomanNumeral do
	describe ".romanize" do
		it "converts 1000 to M" do
			expect(RomanNumeral.romanize(1000)).to eq("M")
		end
		it "converts 900  to CM" do
			expect(RomanNumeral.romanize(900)).to eq("CM")
		end
		it "converts 700  to DCC" do
			expect(RomanNumeral.romanize(700)).to eq("DCC")
		end
		it "converts 500  to D" do
			expect(RomanNumeral.romanize(500)).to eq("D")
		end
		it "converts 450  to CDL" do
			expect(RomanNumeral.romanize(450)).to eq("CDL")
		end
		it "converts 225  to CCXXV" do
			expect(RomanNumeral.romanize(225)).to eq("CCXXV")
		end
		it "converts 75   to LXXV" do
			expect(RomanNumeral.romanize(75)).to eq("LXXV")
		end
		it "converts 37   to XXXVII" do
			expect(RomanNumeral.romanize(37)).to eq("XXXVII")
		end
		it "converts 18   to XVIII" do
			expect(RomanNumeral.romanize(18)).to eq("XVIII")
		end
		it "converts 9    to IX" do
			expect(RomanNumeral.romanize(9)).to eq("IX")
		end
		it "converts 4    to IX" do
			expect(RomanNumeral.romanize(4)).to eq("IV")
		end
		it "converts 2    to II" do
			expect(RomanNumeral.romanize(2)).to eq("II")
		end
		it "converts 1    to I" do
			expect(RomanNumeral.romanize(1)).to eq("I")
		end
	end
	describe ".unromanize" do
		it "converts M to 1000" do
			expect(RomanNumeral.unromanize("M")).to eq(1000)
		end
		it "converts CM to 900" do
			expect(RomanNumeral.unromanize("CM")).to eq(900)
		end
		it "converts DCC to 700" do
			expect(RomanNumeral.unromanize("DCC")).to eq(700)
		end
		it "converts D to 500" do
			expect(RomanNumeral.unromanize("D")).to eq(500)
		end
		it "converts CDL to 450" do
			expect(RomanNumeral.unromanize("CDL")).to eq(450)
		end
		it "converts CCXXV to 225" do
			expect(RomanNumeral.unromanize("CCXXV")).to eq(225)
		end
		it "converts LXXV to 75" do
			expect(RomanNumeral.unromanize("LXXV")).to  eq(75)
		end
		it "converts XXXVII to 37" do
			expect(RomanNumeral.unromanize("XXXVII")).to  eq(37)
		end
		it "converts XVIII to 18" do
			expect(RomanNumeral.unromanize("XVIII")).to  eq(18)
		end
		it "converts IX to 9" do
			expect(RomanNumeral.unromanize("IX")).to   eq(9)
		end
		it "converts IX to 4" do
			expect(RomanNumeral.unromanize("IV")).to   eq(4)
		end
		it "converts II to 2" do
			expect(RomanNumeral.unromanize("II")).to   eq(2)
		end
		it "converts I to 1" do
			expect(RomanNumeral.unromanize("I")).to   eq(1)
		end
	end

	describe ".roman_math" do
		it "converts X + X to 20" do
			expect(RomanNumeral.roman_math("X + X")).to eq(20)
		end
		it "converts X + X * IV to 40" do
			expect(RomanNumeral.roman_math("X + X * IV")).to eq(50)
		end
		it "converts X + X * IV - III to 47" do
			expect(RomanNumeral.roman_math("X + X * IV - III")).to eq(47)
		end
		it "converts X * X / II to 50" do
			expect(RomanNumeral.roman_math("X * X / II")).to eq(50)
		end
		it "converts X * X * II to 200" do
			expect(RomanNumeral.roman_math("X * X * II")).to eq(200)
		end
		it "converts L / V to 10" do
			expect(RomanNumeral.roman_math("L / V")).to eq(10)
		end
	end
end
