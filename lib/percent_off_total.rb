class Percent_off_total

  attr_reader :amount, :percentage, :offer_type

  def initialize(percentage, amount)
    @amount = amount
    @percentage = percentage
    @offer_type = 'on_total'
  end

  def apply?(pre_total)
    pre_total > amount
  end

  def apply(pre_total)
    if apply?(pre_total)
      pre_total = pre_total - ((percentage * pre_total) / 100)
      pre_total.round(2)
    end
  end

end
