require 'checkout'

describe Checkout do

  let(:co) { Checkout.new([]) }
  let(:lavender_heart) { Item.new('001', 'Lavender heart', 9.25) }
  let(:kids_tshirt) { Item.new('003', 'Kids T-shirt', 19.95) }

  it 'should be initialized with an array of promotional rules' do
    expect(co.promotional_rules).to eq([])
  end

  it 'should have a basket' do
    expect(co.basket).to eq([])
  end

  it 'should be able to scan items' do
    co.scan(lavender_heart)
    co.scan(kids_tshirt)
    expect(co.basket).to eq([lavender_heart, kids_tshirt])
  end

end
