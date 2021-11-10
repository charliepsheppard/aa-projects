def range(start, last)
  return [] if last < start
  [start] + range(start + 1, last)
end

# p range(0, 5)
# p range(3, 6)
# p range(1, 7)

def exp_1(base, exp)
  return 1 if exp == 0
  base * exp_1(base, exp - 1)
end

# p exp_1(5, 0)
# p exp_1(5, 3)
# p exp_1(2, 4)

def exp_2(base, exp)
  return 1 if exp == 0
  if exp.even?
    exp_2(base, exp / 2) ** 2
  else
    base * (exp_2(base, (exp - 1) / 2) ** 2)
  end
end

# p exp_1(5, 0)
# p exp_1(5, 3)
# p exp_1(2, 4)

class Array

  def deep_dup
    return self if self.length <= 1

    dup_arr = []
    self.each do |ele|
      if ele.is_a?(Array)
        dup_arr << ele.deep_dup
      else
        dup_arr += [ele]
      end
    end
    dup_arr
  end
end

# dup_arr = [1, [2], [3, [4]]]

# dup_arr = [2]
# [2].deep_dup

# dup_arr = [3] << [4] => [3, [4]]
# [3, [4]].deep_dup

# test = [1, [2], [3, [4]]]
# p test.deep_dup

def fibonacci(n)
  return [1] if n <= 1
  return [1, 1] if n == 2
  prev_fib = fibonacci(n - 1)
  prev_fib << prev_fib[-1] + prev_fib[-2]
end

# p fibonacci(1)
# p fibonacci(2)
# p fibonacci(5)
# p fibonacci(7)

def binary_search(array, target)
  # Find the middle index of the array
  # Check the element at the middle index
  # if the middle index is less than target
    # search from 0 index to up to mid exclusive
  # elsif
    # search from mid + 1 to -1
  # otherwise
    # return the middle index
  
  return nil if array.length == 1 && array[0] != target

  middle = array.length / 2
  val = array[middle]

  return middle if target == val

  if target < val
    return middle - binary_search(array[0...middle], target)
  else
    return middle +  binary_search(array[middle + 1..-1], target)
  end

end

# middle == 3
# val == 4
# run binary_search

p binary_search([1, 2, 3], 1) # => 0
p binary_search([2, 3, 4, 5], 3) # => 1
p binary_search([2, 4, 6, 8, 10], 6) # => 2
p binary_search([1, 3, 4, 5, 9], 5) # => 3
p binary_search([1, 2, 3, 4, 5, 6], 6) # => 5
p binary_search([1, 2, 3, 4, 5, 6], 0) # => nil
p binary_search([1, 2, 3, 4, 5, 7], 6) # => nil
