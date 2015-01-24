class Percent_off

  attr_reader :amount, :percentage

  def initialize(percentage, amount)
    @amount = amount
    @percentage = percentage
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
