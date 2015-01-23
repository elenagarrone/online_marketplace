class Item

  attr_reader :name, :product_code, :price

  def initialize(product_code, name, price)
    @name = name
    @product_code = product_code
    @price = price
  end

end
