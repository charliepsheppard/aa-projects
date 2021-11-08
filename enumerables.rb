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
end

arr = [1, 2, 3]
# arr.my_each { |el| p el }
# p arr.my_select { |el| el.even? }
# p arr.my_reject { |el| el.even? }
# p arr.my_any? { |ele| ele.even? }