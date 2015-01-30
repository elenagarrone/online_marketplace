class Percent_off_total

  attr_reader :percentage, :offer_type
  attr_accessor :amount

  def initialize(percentage, amount)
    @amount = amount
    @percentage = percentage
    @offer_type = 'on_total'
  end

  def apply?(pre_total)
    pre_total > amount
  end

  def apply(pre_total)
    (pre_total - percentage_on(pre_total)).round(2) if apply?(pre_total)
  end


  private

  def percentage_on(pre_total)
    (percentage * pre_total) / 100
  end

end
