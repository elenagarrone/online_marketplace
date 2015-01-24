class Percent_off

  attr_reader :price, :percentage

  def initialize(percentage, price)
    @price = price
    @percentage = percentage
  end

end
