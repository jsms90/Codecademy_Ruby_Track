class Account
    attr_reader :name, :balance
    def initialize (name, balance=100)
        @name = name
        @balance = balance
    end
    
    private
    
    def pin
        @pin = 1234
    end
    
    def pin_error
        "Access denied: incorrect PIN."
    end
    
    public
    
    def display_balance (pin_number)
        if pin_number == pin
            puts "Balance: $#{@balance}."
        else puts pin_error
        end
    end
    
    def withdraw (pin_number, amount)
        if pin_number == pin
            if amount <= @balance
                @balance -= amount
                puts "Withdwrew #{amount}. New balance $#{balance}."
            else puts "Insufficient funds"
            end
        else puts pin_error
        end
    end
    
    def deposit (pin_number, amount)
        if pin_number == pin?
            @balance += amount
            puts "Deposited #{amount}. New balance $#{balance}."
        else puts pin_error
        end
    end
end

class CheckingAccount < Account
    def initialize (name, balance=100, overdraft=1000)
        @name = name
        @balance = balance
        @overdraft = overdraft
    end
end

class SavingsAccount < Account
    def withdraw
        puts "Withdrawls are not permitted from a savings account."
    end
end