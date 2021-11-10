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

test = [1, [2], [3, [4]]]
p test.deep_dup