def my_uniq(arr)
  unique_idxs = []

  arr.each do |ele|
    if !unique_idxs.include?(ele)
      unique_idxs << ele
    end
  end
  unique_idxs
end

def two_sum(array)
  pairs = []

  (0...array.length).each do |i|
    (0...array.length).each do |j|
      next if j <= i
      pairs << [i, j] if array[i] + array[j] == 0
    end
  end

  pairs
end

def my_transpose(matrix)
  new_matrix = []

  i = 0
  while i < matrix[0].length
    new_sub = []
    matrix.each do |sub_array|
      new_sub << sub_array[i]
    end
    new_matrix << new_sub

    i += 1
  end

  new_matrix
end

def stock_picker(stock_prices)
  buy_sell = []

  buy_sell << stock_prices.index(stock_prices.min)
  buy_sell << stock_prices.index(stock_prices.max)

  buy_sell
end