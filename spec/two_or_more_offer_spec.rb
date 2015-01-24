require 'two_or_more_offer'

describe Two_or_more_offer do

  let(:lavender_heart) { Item.new('001', 'Lavender heart', 9.25) }
  let(:two_or_more) { Two_or_more_offer.new(lavender_heart, 8.50) }
  let(:co) { Checkout.new([two_or_more]) }

  it 'should know the item to which apply the offer' do
    expect(two_or_more.item).to be(lavender_heart)
  end

  it 'should know the new price to apply to the product' do
    expect(two_or_more.new_price).to eq(8.50)
  end

  it 'shoud know when to apply itslef to the basket' do
    co.scan(lavender_heart)
    expect(two_or_more.apply?(co.basket)).to eq(false)
  end

  it 'shoud know when it cannot apply itself to the basket' do
    co.scan(lavender_heart)
    co.scan(lavender_heart)
    expect(two_or_more.apply?(co.basket)).to eq(true)
  end

  it 'should apply itself' do
    co.scan(lavender_heart)
    co.scan(lavender_heart)
    expect(two_or_more.apply(co.basket)).to eq('Applied')
  end

end
