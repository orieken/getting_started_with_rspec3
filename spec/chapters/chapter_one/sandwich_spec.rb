require 'spec_helper'

Sandwich = Struct.new(:taste, :toppings)

describe 'An ideal sandwich' do
  before { @sandwich = Sandwich.new('delicious', []) }
  it 'is delicious' do
    expect(@sandwich.taste).to eq('delicious')
  end

  it 'lets me add toppings' do
    @sandwich.toppings << 'cheese'
    expect(@sandwich.toppings).not_to be_empty
  end
end