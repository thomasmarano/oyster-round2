require 'oystercard'

describe Oystercard do

    subject(:oystercard) {Oystercard.new}

    describe '#balance' do
        it 'has a balance of 0' do
            expect(oystercard.balance).to eq(0)
        end
    end

    describe '#top_up' do
        it 'increases the balance by 10' do
            expect{oystercard.top_up(10)}.to change{oystercard.balance}.by(10)
        end
    end

end
