require 'percent_off'

describe Percent_off do

  let(:ten_percent_off) { Percent_off.new(10, 60.0) }

  it 'should know the price to which apply itself' do
    expect(ten_percent_off.price).to eq(60.0)
  end

  it 'should know the percentage to apply' do
    expect(ten_percent_off.percentage).to eq(10)
  end

end
