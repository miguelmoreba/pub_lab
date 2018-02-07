require_relative("drink")

class Pub

  def initialize(name)
    @name = name
    @till = 100
    @drinks = [
      Drink.new("Vodka", 4, 7),
      Drink.new("Whiskey", 11, 4),
      Drink.new("Gin", 4, 6),
      Drink.new("Scotch", 5, 7)
    ]
  end

  def increase_till(amount)
    @till += amount
  end

  def find_drink_by_name(name)
    for drink in @drinks
      return drink if drink.name == name
    end
    return nil
  end

  def sell_drink(customer, drink_name)
    return false if !check_age(customer)
    drink = find_drink_by_name(drink_name)
    return false if drink == nil
    return false if !customer.reduce_wallet(drink.price)
    increase_till(drink.price)
    return true
  end

  def check_age(customer)
    return customer.age >= 18
  end

end
