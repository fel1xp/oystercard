require 'oystercard'

describe Oystercard do
 

  describe '#initialize' do
    it 'returns the 0 balance of a new Oyster account' do
      oystercard = Oystercard.new
      expect(oystercard.balance).to eq 0
    end
  end

  describe 'maximum balance' do
    it 'returns  error if balance will exceed £90' do
      oystercard = Oystercard.new
      maximum_balance = Oystercard::MAX_BALANCE
      oystercard.topup(maximum_balance)
      expect { oystercard.topup(1) }.to raise_error "Balance cannot exceed #{Oystercard::git aMAX_BALANCE}"
    end
  end

  it 'can deduct from the balance' do
    expect{ subject.deduct(5) }.to change{ subject.balance }.by -5
  end

  it 'can topup from the balance' do
    expect{ subject.topup(5) }.to change{ subject.balance }.by 5
  end

end
