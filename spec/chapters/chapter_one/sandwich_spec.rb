require 'spec_helper'

describe 'An ideal sandwich' do
  it 'is delicious' do
    sandwich = Sandwich.new('delicious', [])
    expect(sandwich.taste).to eq('delicious')
  end
end