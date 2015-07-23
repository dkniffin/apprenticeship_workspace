require_relative '../roman_numerals'

describe ".romanize" do
	subject(:converter) { Converter.new }

	it "converts 1000 to M" do
		expect(converter.romanize(1000)).to eq("M")
	end
	it "converts 900  to CM" do
		expect(converter.romanize(900)).to eq("CM")
	end
	it "converts 700  to DCC" do
		expect(converter.romanize(700)).to eq("DCC")
	end
	it "converts 500  to D" do
		expect(converter.romanize(500)).to eq("D")
	end
	it "converts 450  to CDL" do
		expect(converter.romanize(450)).to eq("CDL")
	end
	it "converts 225  to CCXXV" do
		expect(converter.romanize(225)).to eq("CCXXV")
	end
	it "converts 75   to LXXV" do
		expect(converter.romanize(75)).to eq("LXXV")
	end
	it "converts 37   to XXXVII" do
		expect(converter.romanize(37)).to eq("XXXVII")
	end
	it "converts 18   to XVIII" do
		expect(converter.romanize(18)).to eq("XVIII")
	end
	it "converts 9    to IX" do
		expect(converter.romanize(9)).to eq("IX")
	end
	it "converts 4    to IX" do
		expect(converter.romanize(4)).to eq("IV")
	end
	it "converts 2    to II" do
		expect(converter.romanize(2)).to eq("II")
	end
	it "converts 1    to I" do
		expect(converter.romanize(1)).to eq("I")
	end
end
