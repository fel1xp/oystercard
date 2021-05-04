require 'oystercard'

describe Oystercard do
  describe '#initialize' do
    it 'returns the 0 balance of a new Oyster account' do
      oystercard = Oystercard.new
      expect(oystercard.balance).to eq 0
    end
  end

  describe '#topup()' do
    it 'checks the oystercard is topped up' do
      oystercard = Oystercard.new
      expect{ oystercard.topup(20) }.to change{ oystercard.balance }.by 20
    end
  end
end
