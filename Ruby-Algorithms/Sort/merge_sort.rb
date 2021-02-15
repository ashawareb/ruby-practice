# Time Complexity: О(n log n) average and worst-case
# Space Complexity: О(n) auxiliary
# Stable: Yes

class Array
  def merge_sort!
    if self.size <= 1
      return self
    end
    mid = self.size / 2
    left = self[0...mid]
    right = self[mid...self.size]
    merge(left.merge_sort!, right.merge_sort!)
  end

  def merge(left, right)
    sorted = []
    until left.empty? || right.empty?
      if left.first <= right.first
        sorted << left.shift
      else
        sorted << right.shift
      end
    end
    sorted + left + right
  end
end

puts [5, 4, 3, 1, 2].merge_sort!
