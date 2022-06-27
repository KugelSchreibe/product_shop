require_relative 'Product'

class Movie < Product
  attr_accessor :producer, :release_year, :title

  def self.from_file(path)
    file = File.new(path)

    # file = File.new(path, chomp: true) - у меня не работал chomp таким образом
    # поэтому использовал блок map
    data = file.readlines.map(&:chomp)
    file.close

    Movie.new(title: data[0], producer: data[1], release_year: data[2], price: data[3],
              quantity: data[4])
  end

  def initialize(data)
    super
    @title = data[:title]
    @producer = data[:producer]
    @release_year = data[:release_year]
  end

  def update(new_data)
    super
    @title = new_data[:title] unless new_data[:title].nil?
    @producer = new_data[:producer] unless new_data[:producer].nil?
    @release_year = new_data[:release_year] unless new_data[:release_year].nil?
  end

  def to_s
    "Фильм «#{@title}», #{@release_year}, #{@producer}, #{@price} руб. (осталось #{@quantity})"
  end
end
