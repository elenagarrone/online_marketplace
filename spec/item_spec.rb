require 'item'

describe Item do

  context "should be initialized:" do

    let(:lavender_heart) { Item.new('001', 'Lavender heart', 9.25) }

    it 'with a name' do
      expect(lavender_heart.name).to eq('Lavender heart')
    end

    it 'with a product code' do
      expect(lavender_heart.product_code).to eq('001')
    end

    it 'with a price' do
      expect(lavender_heart.price).to eq(9.25)
    end

  end

end
