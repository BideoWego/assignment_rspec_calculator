require 'spec_helper'

require_relative '../lib/calculator.rb'

describe Calculator do
	let(:calculator){Calculator.new}
	let(:calculator_stringify){Calculator.new(true)}

	describe '#initialize' do
		it 'returns a new instance of the calculator class' do
			expect(calculator).to be_an_instance_of(Calculator)
		end
		it 'takes a boolean parameter on initialization' do
			expect {calculator_stringify}.to_not raise_error(StandardError)
		end
	end

	describe '#add' do
		it 'returns the sum of 2 positive integers' do
			expect(calculator.add(1, 1)).to eq(2)
		end

		it 'returns the sum of 2 positive floats' do
			expect(calculator.add(1.0, 1.0)).to eq(2.0)
		end

		it 'returns the sum of 2 negative integers' do
			expect(calculator.add(-1, -1)).to eq(-2)
		end

		it 'returns the sum of 2 negative floats' do
			expect(calculator.add(-1.0, -1.0)).to eq(-2.0)
		end
	end

	describe '#subtract' do
		it 'returns the difference of 2 positive integers' do
			expect(calculator.subtract(1, 1)).to eq(0)
		end

		it 'returns the difference of 2 positive floats' do
			expect(calculator.subtract(1.0, 1.0)).to eq(0.0)
		end

		it 'returns the difference of 2 negative integers' do
			expect(calculator.subtract(-2, -2)).to eq(0)
		end

		it 'returns the difference of 2 negative floats' do
			expect(calculator.subtract(-2.0, -2.0)).to eq(0.0)
		end
	end

	describe '#multiply' do
		it 'properly multiplies 2 numbers' do
			expect(calculator.multiply(4, 4)).to eq(16)
		end
	end

	describe '#divide' do
		it 'divides 2 integers' do
			expect(calculator.divide(8, 2)).to eq(4)
		end

		it 'divides 2 floats' do
			expect(calculator.divide(32.0, 2.0)).to eq(16.0)
		end

		it 'raises an error if the second argument is 0' do
			expect {calculator.divide(1234, 0)}.to raise_error(StandardError)
		end

		it 'returns an integer if there is no remainder' do
			expect(calculator.divide(4, 2)).to be_a(Integer)
		end

		it 'returns a float if there is a remainder' do
			expect(calculator.divide(3, 2)).to be_a(Float)
		end
	end

	describe '#pow' do
		it 'method properly raises positive integers to their power' do
			expect(calculator.pow(4, 2)).to eq(16)
		end

		it 'method properly raises negative integers to their power' do
			expect(calculator.pow(-3, 3)).to eq(-27)
		end

		it 'method properly raises positive floats to their power' do
			expect(calculator.pow(1.25, 2)).to eq(1.5625)
		end

		it 'method properly raises negative floats to their power' do
			expect(calculator.pow(1.25, 3)).to eq(1.953125)
		end
	end

	describe '#sqrt' do
		it 'returns the square root of an integer' do
			expect(calculator.sqrt(16)).to eq(4)
		end

		it 'returns the square root of a float' do
			expect(calculator.sqrt(1.5)).to eq(1.22)
		end

		it 'limits precision to 2 decimal places' do
			expect(calculator.sqrt(6)).to eq(2.45)
		end

		it 'raises an error for negative inputs' do
			expect {calculator.sqrt(-1234)}.to raise_error(StandardError)
		end
	end

	describe '#memory' do
		it 'is readable and writable' do
			expect do
				calculator.memory
				calculator.memory = 100
			end.to_not raise_error(StandardError)
		end

		it 'defaults to nil' do
			expect(calculator.memory).to be_nil
		end

		it 'overwrites previous values when set' do
			calculator.memory = 1234
			calculator.memory = 4321
			expect(calculator.memory).to eq(4321)
		end

		it 'reading from memory is destructive' do
			calculator.memory = 4321
			calculator.memory
			expect(calculator.memory).to be_nil
		end
	end

	context 'stringify is set to true' do
		it 'returns the result of operations as a string' do
			expect(calculator_stringify.add(1, 1)).to eq('2')
			expect(calculator_stringify.subtract(1, 1)).to eq('0')
			expect(calculator_stringify.multiply(4, 4)).to eq('16')
			expect(calculator_stringify.divide(8, 2)).to eq('4')
			expect(calculator_stringify.pow(4, 2)).to eq('16.0')
			expect(calculator_stringify.sqrt(16)).to eq('4')
		end
	end
end