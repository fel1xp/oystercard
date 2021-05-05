require 'oystercard'

describe Oystercard do
 

  describe '#initialize' do
    it 'returns the 0 balance of a new Oyster account' do
      oystercard = Oystercard.new
      expect(oystercard.balance).to eq 0
    end
  end

  describe '#topup()' do
    it 'returns  error if balance will exceed £90' do
      oystercard = Oystercard.new
      maximum_balance = Oystercard::MAX_BALANCE
      oystercard.topup(maximum_balance)
      expect { oystercard.topup(1) }.to raise_error 'Balance cannot exceed maximum balance'
    end


    it 'checks the oystercard is topped up' do
      oystercard = Oystercard.new
      oystercard.topup(20)
      expect(oystercard.balance).to eq 20
    end
  end
end
