require_relative 'lib/Book'
require_relative 'lib/Movie'
require_relative 'lib/ProductCollection'

product_collection = ProductCollection.new(ProductCollection.from_dir("#{Dir.pwd}/data"))

user_choice = nil
sum_of_money = 0
purchased = []

until user_choice == 0
  puts "Что хотите купить:"
  puts

  product_collection.to_a.each_with_index do |product, index|
    puts "#{index + 1}. #{product}"
  end

  puts "0. Выход"
  puts

  user_choice = STDIN.gets.to_i
  if user_choice <= product_collection.to_a.size && user_choice.positive?
    sum_of_money += product_collection.to_a[user_choice - 1].buy
    purchased << product_collection.to_a[user_choice - 1]

    puts
    puts "Вы выбрали: #{product_collection.to_a[user_choice - 1]}"
    puts
    puts "Всего товаров на сумму: #{sum_of_money}"
    puts
  end
end

puts "Вы купили:"
puts
purchased.each { |product| puts "#{product}" }
puts
puts "С Вас - #{sum_of_money}. Спасибо за покупки!"
puts
