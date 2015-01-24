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

  def promotion_available?
    if !promotional_rules.empty?
      promotional_rules.each { |rule|
        return promotional_rules.include?(rule)
      }
    else
      'No promotions available'
    end
  end

end
