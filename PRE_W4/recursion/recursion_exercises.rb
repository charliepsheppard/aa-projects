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
    binary_val = binary_search(array[0...middle], target)
    if binary_val
      return  binary_val
    else 
      nil
    end
  else
    binary_val = binary_search(array[middle..-1], target)
    if binary_val
      return middle + binary_val
    else 
      nil
    end
  end
end

# p binary_search([1, 2, 3], 1) # => 0
# p binary_search([2, 3, 4, 5], 3) # => 1
# p binary_search([2, 4, 6, 8, 10], 6) # => 2
# p binary_search([1, 3, 4, 5, 9], 5) # => 3
# p binary_search([1, 2, 3, 4, 5, 6], 6) # => 5
# p binary_search([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 3) # => 2
# p binary_search([1, 2, 3, 4, 5, 6], 0) # => nil
# p binary_search([1, 2, 3, 4, 5, 7], 6) # => nil

def merge_sort(arr)
  return arr if arr.length == 1
  mid = arr.length/2
  left = merge_sort(arr[0...mid])
  right =merge_sort(arr[mid..-1])
  merge(left, right)

end

def merge(left, right)
  merge_arr = []
  while left.length > 0 && right.length > 0
    if left[0] > right[0]
      merge_arr << right[0]
      right.shift
    else
      merge_arr << left[0]
      left.shift
    end
  end

  if left.length == 0
    merge_arr += right
  else
    merge_arr += left
  end

  return merge_arr
end


# test_arr = (1..100).to_a.sample(10)
# p test_arr
# p merge_sort(test_arr)



# test_arr = [5, 4]
# p merge_sort(test_arr)
# test_arr = [5, 4, 1]
# p merge_sort(test_arr)



# [5, 4]

# [5]     []

# [4, 5]

# base array length 0 or 1
# find middle
# left = arr[0...mid], right = arr[mid..-1]
# mergesort(left)
# mergesort(right)

# merge(left, right)
# new_arr
# check if the left[0] < right[0]
# if left is smaller new_arr << left[0]
# left.shift
# if right is smaller 
# new_arr << right[0]
# right.shift

# once one array is empty, ex left is empty
# new_arr + right

# [ 4, 2, 5] [599, 123, 4112]

