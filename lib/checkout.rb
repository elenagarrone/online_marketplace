class Checkout

  attr_reader :promotional_rules, :basket

  def initialize(promotional)
    @promotional_rules = promotional.rules
    @basket = []
  end

  def scan(item)
    basket << item
  end

  def clear_basket
    basket.clear
  end

  def total
      apply_discount_on_total[0] || pre_total
  end

  def pre_total
    apply_discount_on_item
    items_price.inject(&:+).round(2)
  end

  def items_price
    basket.map { |item| item.price }
  end

  def apply_discount_on_item
    rules_on_items.map { |rule| rule.apply(basket) }
  end

  def apply_discount_on_total
    rules_on_total.map { |rule| rule.apply(pre_total) }
  end

  def rules_on_items
    promotional_rules.select { |rule| rule if rule.offer_name == 'two_or_more' }
  end

  def rules_on_total
    promotional_rules.select { |rule| rule if rule.offer_name == 'percent_off' }
  end

end
