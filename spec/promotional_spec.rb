require 'promotional'

describe Promotional do

  let(:promotional) { Promotional.new }

  it 'should have an array of rules' do
    expect(promotional.rules).to eq([])
  end

end
