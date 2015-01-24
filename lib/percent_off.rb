class Percent_off

  attr_reader :amount, :percentage

  def initialize(percentage, amount)
    @amount = amount
    @percentage = percentage
  end

  def apply?(total)
    return total > amount
  end

  def apply(total)
    if apply?(total)
      calculate_percentage
      percentage - amount
    end
  end

end
