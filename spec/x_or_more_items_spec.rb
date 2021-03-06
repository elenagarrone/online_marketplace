require 'x_or_more_items'

describe X_or_more_items do

  let(:lavender_heart) { Item.new('001', 'Lavender heart', 9.25) }
  let(:two_or_more)    { X_or_more_items.new(2, lavender_heart, 8.50) }
  let(:promotional)    { Promotional.new }
  let(:co)             { Checkout.new(promotional) }

  before(:each) { promotional.add(two_or_more) }

  it 'should know the item to which apply the offer' do
    expect(two_or_more.item).to be(lavender_heart)
  end

  it 'should know the item name' do
    expect(two_or_more.item_name).to eq('Lavender heart')
  end

  it 'should know the new price to apply to the product' do
    expect(two_or_more.new_price).to eq(8.50)
  end

  it 'should have an offer type' do
    expect(two_or_more.offer_type).to eq('on_item')
  end

  it 'shoud know when it cannot apply itself to the basket' do
    co.scan(lavender_heart)
    expect(two_or_more.apply?(co.basket)).to eq(false)
  end

  it 'shoud know when to apply itself to the basket' do
    2.times { co.scan(lavender_heart) }
    expect(two_or_more.apply?(co.basket)).to eq(true)
  end

  it 'should apply itself to the items' do
    2.times { co.scan(lavender_heart) }
    expect{ two_or_more.apply(co.basket) }.to change{ lavender_heart.price }.to(8.5)
  end

end
