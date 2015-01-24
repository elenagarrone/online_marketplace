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
    total = items_price.inject(&:+)
    if promotion_available?
      apply_discount_on_item
      return total
    end
    if promotion_available?
      apply_discount_on_item
    end

  end

  def promotion_available?
    !promotional_rules.empty? ? rule_included? : 'No promotions available'
  end

  def pre_total
    items_price.inject(&:+)
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

  def apply_discount_on_item
    print rules_on_items.map { |rule| rule.apply(basket) if rule != nil} 
  end

  def apply_discount_on_total
    rules_on_total[0].apply(basket)
  end

  def rules_on_items
    promotional_rules.select { |rule| rule if rule.offer_name == 'two_or_more' }
  end

  def discount_on_total
    promotional_rules.select { |rule| rule if rule == 'percent_off' }
  end

end
