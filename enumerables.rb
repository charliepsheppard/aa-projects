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
      if sub_array.length < longest
        (longest - sub_array.length).times do |number|
          sub_array << nil
        end
      end
      sub_array
    end

    new_self = []

    self.my_each { |ele| new_self << ele }

    if self.length < longest
      (longest - self.length).times do |number|
        new_self << nil
      end
    end

    
    added = [new_self] + mapped
    added.transpose[0..self.length - 1]

   
  end


  def my_rotate(n = 1)

    new_array = []
    if n < 0 
      n = self.length - n.abs
    end
    index_to_rotate = self[0...(n % self.length)]
    new_array << self[(n % self.length)..-1] + index_to_rotate
    
  end

  def my_join(str = "")
    final_str = ""

    self.my_each { |ele| final_str += ele + str }

    if str == ""
      return final_str
    end

    final_str[0...-1]
  end

  def my_reverse
    new_array = []
    
    self.my_each { |ele| new_array.unshift(ele) }

    new_array
  end


end

# arr = [1, 2, 3]
# arr.my_each { |el| p el }
# p arr.my_select { |el| el.even? }
# p arr.my_reject { |el| el.even? }
# p arr.my_any? { |ele| ele.even? }
# p arr.my_all? { |ele| ele.even? }

# p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]

# a = [ 4, 5, 6 ]
# b = [ 7, 8, 9 ]
# p [1, 2, 3].my_zip(a, b) # => [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# p a.my_zip([1,2], [8])   # => [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
# p [1, 2].my_zip(a, b)    # => [[1, 4, 7], [2, 5, 8]]

# c = [10, 11, 12]
# d = [13, 14, 15]
# p [1, 2].my_zip(a, b, c, d)    # => [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]


# a = [ "a", "b", "c", "d" ]
# # p a.my_rotate         #=> ["b", "c", "d", "a"]
# # p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
# p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
# # p a.my_rotate(15)     #=> ["d", "a", "b", "c"]
# p a.my_rotate(-5)

# a = [ "a", "b", "c", "d" ]
# p a.my_join         # => "abcd"
# p a.my_join("$")    # => "a$b$c$d"

p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
p [ 1 ].my_reverse               #=> [1]