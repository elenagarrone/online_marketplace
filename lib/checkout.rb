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

  def promotion_available?
    !promotional_rules.empty? ? rule_included? : 'No promotions available'
  end

  private

  def items_price
    basket.map { |item| item.price }
  end

  def rule_included?
    promotional_rules.each { |rule|
      return promotional_rules.include?(rule)
    }
  end

end
