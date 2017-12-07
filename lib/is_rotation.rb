class IsRotation
  def self.test(arr1, arr2)
    return false if arr1.size != arr2.size

    expected = (arr1 * 2).join(',')
    actual = arr2.join(',')

    if expected.index(actual)
      true
    else
      false
    end
  end
end
