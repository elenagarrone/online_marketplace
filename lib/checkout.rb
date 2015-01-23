class Checkout

  attr_reader :promotional_rules

  def initialize(promotional_rules = [])
    @promotional_rules = promotional_rules
  end

end
