class Checkout

  attr_reader :promotional_rules, :basket

  def initialize(promotional_rules = [])
    @promotional_rules = promotional_rules
    @basket = []
  end

end
