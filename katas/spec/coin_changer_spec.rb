# require_relative '../coin_changer.rb'
require_relative '../coin_changer_divmod.rb'

describe "make_change" do
  let(:coin_changer) { CoinChanger.new }

  context "where I expect only the same coin" do
    it "works for quarters!" do
      expect(coin_changer.make_change(75)).to eq([25,25,25])
    end

    it "works for dimes!" do
      expect(coin_changer.make_change(20)).to eq([10,10])
    end

    it "works for nickels!" do
      expect(coin_changer.make_change(5)).to eq([5])
    end

    it "works for pennies!" do
      expect(coin_changer.make_change(4)).to eq([1,1,1,1])
    end
  end

  context "where I expect a combination of coins" do
    it "works!" do
      expect(coin_changer.make_change(87)).to eq([25,25,25,10,1,1])
    end
  end

  context "with edge cases" do
    it "works with zero" do
      expect(coin_changer.make_change(0)).to eq([])
    end
  end
end
