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

p exp_1(5, 0)
p exp_1(5, 3)
p exp_1(2, 4)