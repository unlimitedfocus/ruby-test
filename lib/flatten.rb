class Flatten
  def self.apply(array)
    result = []
    array.each do |item|
      if item.is_a?(Array)
        result += apply(item)
      else
        result << item
      end
    end

    result
  end
end
