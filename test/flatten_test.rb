require 'test_helper'
require_relative '../lib/flatten'

class TestFlatten < Minitest::Test
  def setup
    @cases = [
      {
        actual: [1, 2, 3],
        expected: [1, 2, 3]
      },
      {
        actual: [1, [2], 3],
        expected: [1, 2, 3]
      },
      {
        actual: [1, [2, [3]], 4],
        expected: [1, 2, 3, 4]
      }
    ]
  end

  def test_apply
    assert_equal [1, 2, 3, 4, 5, 6, 7, 8], Flatten.apply([[1], 2, [[3,4], 5], [[[]]], [[[6]]], 7, 8, []])
  end

  def test_cases
    @cases.each do |test_case|
      assert_equal test_case[:expected], Flatten.apply(test_case[:actual])
    end
  end
end
