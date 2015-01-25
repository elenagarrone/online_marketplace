class Two_or_more_offer

  attr_reader :item, :new_price, :offer_name

  def initialize(item, new_price)
    @item = item
    @new_price = new_price
    @offer_name = 'two_or_more'
  end

  def apply?(basket)
    items_in_offer = basket.select { |item| item if item.name == item_name }
    return items_in_offer.count >= 2
  end

  def apply(basket)
    if apply?(basket)
      basket.each { |item| item.price = new_price if item.name == item_name }
    end
  end

  def item_name
    item.name
  end

end
