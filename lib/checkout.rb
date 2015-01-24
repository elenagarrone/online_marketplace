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
    if promotion_available?
      apply_promotions
    end
    return items_price.inject(&:+)
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

  def apply_promotions
    promotional_rules.each { |rule| rule.apply(basket) }
  end

end
