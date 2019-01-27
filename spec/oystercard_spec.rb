require 'oystercard'

describe Oystercard do

    subject(:oystercard) {Oystercard.new}

    describe '#balance' do
        it 'has a balance of 0' do
            expect(oystercard.balance).to eq(0)
        end
    end

    describe '#top_up' do
        it 'can top up the balance' do
            expect{oystercard.top_up(10)}.to change{oystercard.balance}.by(10)
        end

        it 'throws an error if new amount exceeds max balance allowed' do
            max_balance = Oystercard::MAX
            expect{oystercard.top_up(max_balance + 1)}.to raise_error{'Exceeds Max Amount of #{max_balance}'}
        end
    end

    describe '#deduct' do
        it 'can deduct the balance' do
            expect{oystercard.deduct(10)}.to change{oystercard.balance}.by(-10)
        end
    end

    describe '#in_journey?' do
        it 'is initially not in journey' do
            expect(oystercard).not_to be_in_journey
        end
    end

    describe '#touch_in' do
        it 'can touch the oystercard in' do
            expect{oystercard.touch_in}.to change{oystercard.travelling}.from(false).to(true)
        end
    end

    describe '#touch_out' do
        it 'can touch the oystercard out' do
            oystercard.touch_in
            expect{oystercard.touch_out}.to change{oystercard.travelling}.from(true).to(false)
        end
    end
end
