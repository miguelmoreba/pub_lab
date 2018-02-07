require('minitest/autorun')
require_relative("../customer")
require_relative("../drink")

class TestCustomer < MiniTest::Test
  def setup
    @customer = Customer.new("Kate", 10, 28)
    @drink = Drink.new("Gin", 4, 6)
  end

  def test_reduce_wallet()
    result = @customer.reduce_wallet(4)
    assert_equal(6, result)
  end

  def test_reduce_wallet__not_enough_money()
    result = @customer.reduce_wallet(11)
    assert_equal(false, result)
  end

  def test_increase_drunkenness()
    @customer.increse_drunkenness(@drink)
    assert_equal(6, @customer.drunkenness)
  end

  def test_buy_drink()
    result = @customer.buy_drink(@drink)
    assert_equal(6, result)
  end


end
