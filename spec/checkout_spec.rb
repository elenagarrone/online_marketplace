require 'checkout'

describe Checkout do

  let(:co) { Checkout.new([]) }

  it 'should be initialized with an array of promotional rules' do
    expect(co.promotional_rules).to eq([])
  end

  it 'should have a basket' do
    expect(co.basket).to eq([])
  end

end
