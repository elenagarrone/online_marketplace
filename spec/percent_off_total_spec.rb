require 'percent_off_total'

describe Percent_off_total do

  let(:ten_percent_off) { Percent_off_total.new(10, 60.0) }
  let(:kids_tshirt)     { Item.new('003', 'Kids T-shirt', 19.95) }
  let(:promotional)     { Promotional.new }
  let(:co)              { Checkout.new(promotional) }

  before(:each) { promotional.add(ten_percent_off) }

  it 'should know the price to which apply itself' do
    expect(ten_percent_off.amount).to eq(60.0)
  end

  it 'should know the percentage to apply' do
    expect(ten_percent_off.percentage).to eq(10)
  end

  it 'should have an offer type' do
    expect(ten_percent_off.offer_type).to eq('on_total')
  end

  it 'shoud know when it cannot apply itself to the basket' do
    co.scan(kids_tshirt)
    expect(ten_percent_off.apply?(co.pre_total)).to eq(false)
  end

  it 'shoud know when to apply itslef to the basket' do
    4.times { co.scan(kids_tshirt) }
    expect(ten_percent_off.apply?(co.pre_total)).to eq(true)
  end

  it 'should apply itself to the total' do
    4.times { co.scan(kids_tshirt) }
    expect(ten_percent_off.apply(co.pre_total)).to eq(71.82)
  end

end
