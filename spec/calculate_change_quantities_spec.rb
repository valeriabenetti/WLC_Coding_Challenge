require_relative '../calculate_change_quantities.rb'  # Include the file containing the method

RSpec.describe '#calculate_change_quantities' do
  context 'when cost or payment is null' do
    it 'raises an ArgumentError' do
      expect { calculate_change_quantities(nil, 500) }.to raise_error(ArgumentError, "Both cost and payment must be provided")
      expect { calculate_change_quantities(256, nil) }.to raise_error(ArgumentError, "Both cost and payment must be provided")
      expect { calculate_change_quantities(nil, nil) }.to raise_error(ArgumentError, "Both cost and payment must be provided")
    end
  end

  context 'when cost or payment is not numeric' do
    it 'raises an ArgumentError' do
      expect { calculate_change_quantities("256", 500) }.to raise_error(ArgumentError, "Cost and payment must be numeric values")
      expect { calculate_change_quantities(256, "500") }.to raise_error(ArgumentError, "Cost and payment must be numeric values")
      expect { calculate_change_quantities("256", "500") }.to raise_error(ArgumentError, "Cost and payment must be numeric values")
      expect { calculate_change_quantities("abc", "def") }.to raise_error(ArgumentError, "Cost and payment must be numeric values")
    end
  end

  context 'when valid inputs are provided' do
    it 'returns the correct change quantities' do
      expect(calculate_change_quantities(256, 500)).to eq([2, 0, 2, 0, 0, 4, 0, 0, 0, 0])
      expect(calculate_change_quantities(5.42, 10.42)).to eq([0, 0, 0, 0, 1, 0, 0, 0, 0, 0])
      expect(calculate_change_quantities(100, 200)).to eq([1, 0, 0, 0, 0, 0, 0, 0, 0, 0])
    end

    it 'returns an input in every denomination' do
      expect(calculate_change_quantities(213.58, 400)).to eq([1, 1, 1, 1, 1, 1, 1, 1, 1, 1])
    end
  end

  context 'when cost equals payment' do
    it 'returns an array of zeros' do
      expect(calculate_change_quantities(100, 100)).to eq([0, 0, 0, 0, 0, 0, 0, 0, 0, 0])
      expect(calculate_change_quantities(0, 0)).to eq([0, 0, 0, 0, 0, 0, 0, 0, 0, 0])
    end
  end

  context 'when payment is less than cost' do
    it 'returns an empty array' do
      expect(calculate_change_quantities(5.00, 1.00)).to eq([])
    end
  end
end