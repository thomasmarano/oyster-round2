class Oystercard

    attr_reader :balance, :in_journey, :travelling, :entry_station

    MAX = 90
    MIN = 1

    def initialize
        @balance = 0
        @travelling = false
        @entry_station
    end

    def top_up(amount)
        raise 'Exceeds Max Balance of #{MAX}' if (@balance + amount > MAX)
        @balance += amount
    end

    def deduct(amount)
        @balance -= amount
    end

    def in_journey?
        !!@entry_station
    end

    def touch_in(station)
        raise 'Insufficient funds' if (@balance < MIN)
        @entry_station = station
        @travelling = true
    end

    def touch_out
        deduct(MIN)
        @travelling = false
        @entry_station = nil
    end


end
