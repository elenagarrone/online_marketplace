class Item

  attr_reader :name, :product_code
  attr_accessor :price

  def initialize(product_code, name, price)
    @name = name
    @product_code = product_code
    @price = price
  end

end
