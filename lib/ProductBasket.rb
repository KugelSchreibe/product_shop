class ProductBasket
  attr_reader :total_price

  def initialize
    @total_price = 0
    @products = []
  end

  def add_product(price, product)
    @products << product
    @total_price += price
  end

  def to_a
    @products
  end
end
