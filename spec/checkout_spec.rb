require 'checkout'

describe Checkout do

  it 'should be initialized with an array of promotional rules' do
    co = Checkout.new([])
    expect(co.promotional_rules).to eq([])
  end

end
