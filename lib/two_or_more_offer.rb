class Two_or_more_offer

  attr_reader :item, :new_price

  def initialize(item, new_price)
    @item = item
    @new_price = new_price
  end

  def apply?(basket)
    lavender_heart = basket.select { |item| item if item.name == item_name }
    return lavender_heart.count >= 2
  end

  def apply(basket)
    if  apply?(basket)
      basket.each { |item| return item.price = new_price }
    end
  end

  def item_name
    item.name
  end

end
