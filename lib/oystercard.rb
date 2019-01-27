class Oystercard

    attr_reader :balance, :in_journey, :travelling

    MAX = 90

    def initialize
        @balance = 0
        @travelling = false
    end

    def top_up(amount)
        raise 'Exceeds Max Balance of #{MAX}' if (@balance + amount > MAX)
        @balance += amount
    end

    def deduct(amount)
        @balance -= amount
    end

    def in_journey?
        @travelling
    end

    def touch_in
        @travelling = true
    end

    def touch_out
        @travelling = false
    end

end
