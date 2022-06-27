class Product
  attr_accessor :price, :quantity

  def self.from_file(path)
    raise "NotImplementedError"
  end

  def initialize(data)
    @price = data[:price].to_i
    @quantity = data[:quantity].to_i
  end

  def buy(amount = 1)
    @quantity -= amount
    @price * amount
  end

  def update(new_data)
    @price = new_data[:price].to_i unless new_data[:price].nil?
    @quantity = new_data[:quantity].to_i unless new_data[:quantity].nil?
  end
end