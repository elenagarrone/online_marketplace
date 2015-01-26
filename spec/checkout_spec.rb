require 'checkout'

describe Checkout do

  let(:lavender_heart) { Item.new('001', 'Lavender heart', 9.25) }
  let(:kids_tshirt) { Item.new('003', 'Kids T-shirt', 19.95) }
  let(:personalised_cufflinks ) { Item.new('002', 'Personalised cufflinks ', 45.0) }
  let(:two_or_more) { Two_or_more_offer.new(lavender_heart, 8.50) }
  let(:ten_percent_off) { Percent_off.new(10, 60.0) }
  let(:promotional) { Promotional.new }
  let(:promotional2) { Promotional.new }
  let(:co) { Checkout.new(promotional) }
  let(:co2) { Checkout.new(promotional2) }

  before(:each) {
    promotional.add(two_or_more)
    promotional.add(ten_percent_off)
  }

  it 'should be initialized with some promotional rules' do
    expect(co.promotional_rules).to eq([two_or_more, ten_percent_off])
  end

  it 'should have a basket' do
    expect(co.basket).to eq([])
  end

  it 'should be able to scan items' do
    co.scan(lavender_heart)
    co.scan(kids_tshirt)
    expect(co.basket).to eq([lavender_heart, kids_tshirt])
  end

  it 'should be able to clear the basket' do
    co.scan(lavender_heart)
    expect(co.basket).to eq([lavender_heart])
    co.clear_basket
    expect(co.basket).to eq([])
  end

  it 'should caluclate the total of the basket' do
    co.scan(lavender_heart)
    co.scan(kids_tshirt)
    expect(co.total).to eq(29.2)
  end

  it 'should caluclate the total of the basket with the promotions ON ITEM' do
    2.times { co.scan(lavender_heart) }
    expect(co.pre_total).to eq(17.0)
  end

  it '(EXAMPLE 1) should caluclate the total of the basket with the promotions ON TOTAL' do
    co.scan(lavender_heart)
    co.scan(personalised_cufflinks)
    co.scan(kids_tshirt)
    expect(co.total).to eq(66.78)
  end

  it '(EXAMPLE 2) should caluclate the total of the basket with the promotions' do
    co.scan(lavender_heart)
    co.scan(kids_tshirt)
    co.scan(lavender_heart)
    expect(co.total).to eq(36.95)
  end

  it '(EXAMPLE 3) should caluclate the total of the basket with the promotions' do
    co.scan(lavender_heart)
    co.scan(personalised_cufflinks)
    co.scan(lavender_heart)
    co.scan(kids_tshirt)
    expect(co.total).to eq(73.76)
  end

end
