class Percent_off

  attr_reader :amount, :percentage, :offer_name

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
      final_total = total - ((percentage * total) / 100)

    end
  end

end
