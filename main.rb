require_relative 'lib/ProductCollection'
require_relative 'lib/ProductBasket'

product_collection = ProductCollection.new(ProductCollection.from_dir("#{Dir.pwd}/data"))

user_choice = nil
product_basket = ProductBasket.new

until user_choice == 0
  puts "Что хотите купить:"
  puts

  product_collection.to_a.each_with_index do |product, index|
    puts "#{index + 1}. #{product}"
  end

  puts "0. Выход"
  puts

  user_choice = STDIN.gets.to_i
  if user_choice <=  product_collection.to_a.size && user_choice.positive?
    selected_product = product_collection.to_a[user_choice - 1].buy
    product_basket.add_product(selected_product.price, selected_product)

    puts
    puts "Вы выбрали: #{selected_product}"
    puts
    puts "Всего товаров на сумму: #{product_basket.total_price}"
    puts
  end
end

puts "Вы купили:"
puts
product_basket.to_a.each { |product| puts "#{product}" }
puts
puts "С Вас - #{product_basket.total_price}. Спасибо за покупки!"
puts
