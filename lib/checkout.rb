class Checkout

  attr_reader :promotional_rules, :basket

  def initialize(promotional_rules = [])
    @promotional_rules = promotional_rules
    @basket = []
  end

  def scan(item)
    basket << item
  end

  def total
    items_price.inject(&:+)
  end

  private

  def items_price
    basket.map { |item| item.price }
  end

end
