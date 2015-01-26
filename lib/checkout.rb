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
      apply_discount_on_total || pre_total
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
    array_of_amounts = rules_on_total.map { |rule| rule.apply?(pre_total) ? rule.amount : 0 }
    array_of_totals = rules_on_total.map { |rule| rule.apply(pre_total) }
    rules_amount = array_of_amounts.compact
    totals = array_of_totals.compact
    hash_of_amounts_totals = Hash[rules_amount.zip(totals)]
    hash_of_amounts_totals.max_by{ |k,v| k }[1]
  end

  def rules_on_items
    promotional_rules.select { |rule| rule if rule.offer_type == 'on_item' }
  end

  def rules_on_total
    promotional_rules.select { |rule| rule if rule.offer_type == 'on_total' }
  end

end
