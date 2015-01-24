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

  def items_price
    basket.map { |item| item.price }
  end

  def promotions_apply?
    promotional_rules.each { |rule| rule.check }
  end

end
