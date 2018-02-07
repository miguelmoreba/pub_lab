require('minitest/autorun')
require_relative('../pub')
require_relative('../customer')

class TestPub < MiniTest::Test

  def setup
    @pub = Pub.new("The Chanter")
    @customer = Customer.new("Kate", 10, 28)
    @young_customer = Customer.new("Miguel", 8, 17)
    @drink = Drink.new("Gin", 4, 6)
  end

  def test_increase_till()
    result = @pub.increase_till(4)
    assert_equal(104, result)
  end

  def test_sell_drink()
    result = @pub.sell_drink(@customer, "Gin")
    assert_equal(true, result)
  end

  def test_sell_drink__not_enough_money()
    result = @pub.sell_drink(@customer, "Whiskey")
    assert_equal(false, result)
  end

  def test_sell_drink__does_not_exist()
    result = @pub.sell_drink(@customer, "Rum")
    assert_equal(false, result)
  end

  def test_sell_drink__too_young()
    result = @pub.sell_drink(@young_customer, "Whiskey")
    assert_equal(false, result)
  end


  def test_check_age()
    result = @pub.check_age(@customer)
    assert_equal(true, result)
  end

  def test_check_age__young()
    result = @pub.check_age(@young_customer)
    assert_equal(false, result)
  end

  def test_find_drink_by_name()
    result = @pub.find_drink_by_name("Gin")
    assert_equal(@drink.name, result.name)
  end

  def test_find_drink_by_name__does_not_exist()
    result = @pub.find_drink_by_name("Rum")
    assert_equal(nil, result)
  end

end
