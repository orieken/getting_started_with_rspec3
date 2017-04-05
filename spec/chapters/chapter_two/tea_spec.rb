require 'spec_helper'

class Tea
  def flavor
    :earl_grey
  end

  def temperature
    205.0
  end
end

describe Tea do
  let(:tea) { Tea.new }

  it 'tastes like Earl Grey' do
    expect(tea.flavor).to be :earl_grey
  end

  it 'is hot' do
    expect(tea.temperature).to be > 200.0
  end

end