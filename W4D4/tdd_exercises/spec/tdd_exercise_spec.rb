require 'tdd_exercise'

describe 'my_uniq' do
  let(:array) { [1, 2, 1, 3, 3] }
  let(:unique_array) { my_uniq(array.dup) }

  it 'Removes duplicates from an array' do
    array.each do |ele|
      expect(unique_array.count(ele)).to eq(1)
    end
  end

  it 'does not change original array' do
    expect { my_uniq(array) }.to_not change{ array }
  end
end

describe 'two_sum' do
  subject(:array) { [-1, 0, 2, -2, 1] }

  it 'returns two_sum pairs' do
    expect(two_sum(array)).to eq([[0, 4], [2, 3]])
  end
end

describe 'my_transpose' do
  let(:matrix) { [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8]
  ] }

  it 'transposes the matrix' do
    expect(my_transpose(matrix)).to eq([[0, 3, 6], [1, 4, 7], [2, 5, 8]])
  end
end

describe 'stock_picker' do
  let(:stock_prices) { [43, 40, 56, 62, 48, 51] }

  it 'finds pair with buy and sell days' do
    expect(stock_picker(stock_prices)).to eq([1, 3])
  end
end