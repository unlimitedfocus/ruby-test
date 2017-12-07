require 'test_helper'
require_relative '../lib/is_rotation'

class TestIsRotation < Minitest::Test
  def setup
  end

  def test_comparison
    assert IsRotation.test([], [])
    assert !IsRotation.test([], [1])
    assert !IsRotation.test([1], [])
    assert IsRotation.test([1], [1])
    assert IsRotation.test([1, 2], [2, 1])
    assert IsRotation.test([1,2,3,1,5], [3,1,5,1,2])
  end
end

