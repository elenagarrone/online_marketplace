require 'checkout'

describe Checkout do

  let(:lavender_heart) { Item.new('001', 'Lavender heart', 9.25) }
  let(:kids_tshirt) { Item.new('003', 'Kids T-shirt', 19.95) }
  let(:two_or_more) { Two_or_more_offer.new(lavender_heart, 8.50) }
  let(:co) { Checkout.new([two_or_more, 'ten_percent_off']) }

  it 'should be initialized with some promotional rules' do
    expect(co.promotional_rules).to eq([two_or_more, 'ten_percent_off'])
  end

  it 'should have a basket' do
    expect(co.basket).to eq([])
  end

  it 'should be able to scan items' do
    co.scan(lavender_heart)
    co.scan(kids_tshirt)
    expect(co.basket).to eq([lavender_heart, kids_tshirt])
  end

  it 'should caluclate the total of the basket' do
    co.scan(lavender_heart)
    co.scan(kids_tshirt)
    expect(co.total).to eq(29.2)
  end

  it 'should know when it can apply a promotion' do
    co.scan(lavender_heart)
    co.scan(lavender_heart)
    expect(co.promotions_apply?).to eq(true)
  end

end
