require 'checkout'

describe Checkout do

  let(:lavender_heart)          { Item.new('001', 'Lavender heart', 9.25) }
  let(:kids_tshirt)             { Item.new('003', 'Kids T-shirt', 19.95) }
  let(:personalised_cufflinks ) { Item.new('002', 'Personalised cufflinks ', 45.0) }
  let(:two_or_more)             { X_or_more_items.new(2, lavender_heart, 8.50) }
  let(:ten_percent_off)         { Percent_off_total.new(10, 60.0) }
  let(:promotional)             { Promotional.new }
  let(:co)                      { Checkout.new(promotional) }

  before(:each) {
    promotional.add(two_or_more)
    promotional.add(ten_percent_off)
  }

  it 'should be initialized with some promotional rules' do
    expect(co.promotional_rules).to eq([two_or_more, ten_percent_off])
  end

  it 'should have a basket' do
    expect(co.basket).to eq([])
  end

  it 'should be able to scan items' do
    co.scan(lavender_heart)
    co.scan(kids_tshirt)
    expect(co.basket).to eq([lavender_heart, kids_tshirt])
  end

  it 'should be able to clear the basket' do
    co.scan(lavender_heart)
    expect(co.basket).to eq([lavender_heart])
    co.clear_basket
    expect(co.basket).to eq([])
  end

  it 'should caluclate the total of the basket if no promotion applies' do
    co.scan(lavender_heart)
    co.scan(kids_tshirt)
    expect(co.total).to eq(29.2)
  end

  it 'should caluclate the total of the basket with the promotions' do
    2.times { co.scan(lavender_heart) }
    expect(co.pre_total).to eq(17.0)
  end

  it '(Basket: 001,002,003) should caluclate the total of the basket with the promotions' do
    co.scan(lavender_heart)
    co.scan(personalised_cufflinks)
    co.scan(kids_tshirt)
    expect(co.total).to eq(66.78)
  end

  it '(Basket: 001,003,001) should caluclate the total of the basket with the promotions' do
    co.scan(lavender_heart)
    co.scan(kids_tshirt)
    co.scan(lavender_heart)
    expect(co.total).to eq(36.95)
  end

  it '(Basket: 001,002,001,003) should caluclate the total of the basket with the promotions' do
    co.scan(lavender_heart)
    co.scan(personalised_cufflinks)
    co.scan(lavender_heart)
    co.scan(kids_tshirt)
    expect(co.total).to eq(73.76)
  end

  context 'Checking behaviour of total when:' do

    it 'two promotions on items are present' do
      four_or_more = X_or_more_items.new(4, kids_tshirt, 8.50)
      promotional.add(four_or_more)
      4.times { co.scan(lavender_heart) }
      4.times { co.scan(kids_tshirt) }
      expect(co.total).to eq(61.20)
    end

    it 'two promotions on total are present' do
      forty_percent_off = Percent_off_total.new(40, 130.0)
      promotional.add(forty_percent_off)
      3.times { co.scan(personalised_cufflinks) }
      expect(co.total).to eq(81.00)
    end

    it "two promotions on total are present but one is not applicable" do
      forty_percent_off = Percent_off_total.new(40, 200.0)
      promotional.add(forty_percent_off)
      3.times { co.scan(personalised_cufflinks) }
      expect(co.total).to eq(121.50)
    end

    it "two promotions are present (one with rule.amount bigger and percentage smaller than the other)" do
      five_percent_off = Percent_off_total.new(5, 61.0)
      promotional.add(five_percent_off)
      3.times { co.scan(personalised_cufflinks) }
      expect(co.total).to eq(128.25)
    end

  end

end
