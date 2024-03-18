class BankAccount
  attr_reader :balance

  def initialize(starting_balance)
    @balance = starting_balance
  end

  def positive_balance?
    balance >= 0
  end
end

#when balance >= 0 on line is accessed, the return value of the balance getter method
#is returned which in turn is the value @balance is referencing. Therefore, no @ or self is
#required.