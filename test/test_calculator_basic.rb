require 'test_helper'
require_relative '../lib/calculator'

class TestCalculator < Minitest::Test
  def setup
    @calc = Calculator.new
  end

  def test_proper_addition
    assert_equal 4, @calc.add(2, 2)
  end

  def test_proper_subtraction
    assert_equal 0, @calc.subtract(2, 2)
  end
end
