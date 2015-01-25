require 'promotional'

describe Promotional do

  let(:promotional) { Promotional.new }
  let(:lavender_heart) { Item.new('001', 'Lavender heart', 9.25) }
  let(:two_or_more) { Two_or_more_offer.new(lavender_heart, 8.50) }

  it 'should have an array of rules' do
    expect(promotional.rules).to eq([])
  end

  it 'should be able to count the rules' do
    expect(promotional.rules_count).to eq(0)
  end

  it 'should be able to add a rule' do
    expect{ promotional.add(two_or_more) }.to change{ promotional.rules_count }.by(1)
  end

  it 'should be able to remove a rule' do
    promotional.add(two_or_more)
    expect{ promotional.remove(two_or_more) }.to change{ promotional.rules_count }.by(-1) 
  end

end
