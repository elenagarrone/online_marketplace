class Percent_off

  attr_reader :amount, :percentage, :offer_name

  def initialize(percentage, amount)
    @amount = amount
    @percentage = percentage
    @offer_name = 'percent_off'
  end

  def apply?(pre_total)
    pre_total > amount
  end

  def apply(pre_total)
    if apply?(pre_total)
      pre_total - ((percentage * pre_total) / 100)
    end
  end

end
