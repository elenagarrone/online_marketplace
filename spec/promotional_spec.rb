require 'promotional'

describe Promotional do

  let(:promotional) { Promotional.new }
  let(:lavender_heart) { Item.new('001', 'Lavender heart', 9.25) }
  let(:two_or_more) { Two_or_more_offer.new(lavender_heart, 8.50) }

  it 'should have an array of rules' do
    expect(promotional.rules).to eq([])
  end

  it 'should be able to count the rouls' do
    expect(promotional.rules_count).to eq(0)
  end

end
