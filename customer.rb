class Customer

attr_reader :wallet, :age
attr_accessor :drunkenness

  def initialize(name, wallet, age)
    @name = name
    @wallet = wallet
    @age = age
    @drunkenness = 0
  end

  def reduce_wallet(amount)
    return false if amount > wallet
    @wallet -= amount
  end

  def increse_drunkenness(drink)
    @drunkenness += drink.alcohol_level
  end

  def buy_drink(drink)
    increse_drunkenness(drink)
    reduce_wallet(drink.price)
  end
end
