class Percent_off

  attr_reader :amount, :percentage, :offer_name
  attr_accessor :discount

  def initialize(percentage, amount)
    @amount = amount
    @percentage = percentage
    @offer_name = 'percent_off'
  end

  def apply?(total)
    total > amount
  end

  def apply(total)
    if apply?(total)
      total = amount - discount
      return total
    end
  end

  def discount
    (percentage * amount) / 100
  end

end
