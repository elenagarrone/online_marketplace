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
    calculate_total
  end


private

  def calculate_total
    items_price.inject(&:+).round(2)
  end

  def items_price
    basket.map { |item| item.price }
  end

  def apply_discount_on_item
    rules_on_items.map { |rule| rule.apply(basket) }
  end

  def apply_discount_on_total
    amounts_and_totals.max_by{ |k,v| k }[1]
  end

  def amounts_and_totals
    Hash[rules_amount.zip(array_of_totals)]
  end

  def rules_amount
    rules_on_total.map { |rule| rule.apply?(pre_total) ? rule.amount : 0 }
  end

  def array_of_totals
    rules_on_total.map { |rule| rule.apply(pre_total) }.compact
  end

  def rules_on_items
    promotional_rules.select { |rule| rule if rule.offer_type == 'on_item' }
  end

  def rules_on_total
    promotional_rules.select { |rule| rule if rule.offer_type == 'on_total' }
  end

end
