class Array
  def my_each(&prc)
    i = 0
    while i < self.length
      prc.call(self[i])
      
      i += 1
    end

    self
  end

  def my_select(&prc)
    new_array = []

    self.my_each do |ele|
      if prc.call(ele)
        new_array << ele
      end
    end
    new_array
  end

  def my_reject(&prc)
    new_array = []

    self.my_each do |ele|
      if !prc.call(ele)
        new_array << ele
      end
    end

    new_array
  end

  def my_any?(&prc)
    self.my_each { |ele| return true if prc.call(ele) }
    false
  end

  def my_all?(&prc)
    self.my_each { |ele| return false if !prc.call(ele) }
    true
  end

  def my_flatten

    # if !self.is_a?(Array)
    #   return [self]
    # end

    new_array = []
    self.my_each do |ele|
      if ele.is_a?(Array)
        new_array += ele.my_flatten
      else
        new_array += [ele]
      end 
    end
    return new_array

  end

  def my_zip(*args)
    new_array = []

    longest = self.length

    args.my_each do |sub_array|
      if sub_array.length > longest
        longest = sub_array.length
      end
    end

    mapped = args.map do |sub_array|
      sub_array.map do |ele|
        if sub_array.length < longest
          (longest - sub_array.length).times do |number|
            sub_array << nil
          end
        else
          ele
        end
      end
    end

    mapped
    # added = [self] + args
    # added.transpose

   
  end




end

# arr = [1, 2, 3]
# arr.my_each { |el| p el }
# p arr.my_select { |el| el.even? }
# p arr.my_reject { |el| el.even? }
# p arr.my_any? { |ele| ele.even? }
# p arr.my_all? { |ele| ele.even? }

# p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]

a = [ 4, 5, 6 ]
b = [ 7, 8, 9 ]
[1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
[1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

c = [10, 11, 12]
d = [13, 14, 15]
[1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]