require_relative 'Product'

class Disk < Product
  attr_accessor :executor, :release_year, :title, :genre

  def self.from_file(path)
    file = File.new(path)

    # file = File.new(path, chomp: true) - у меня не работал chomp таким образом
    # поэтому использовал блок map
    data = file.readlines.map(&:chomp)
    file.close

    Disk.new(title: data[0], executor: data[1], genre: data[2], release_year: data[3], price: data[4],
             quantity: data[5])
  end

  def initialize(data)
    super
    @genre = data[:genre]
    @title = data[:title]
    @executor = data[:executor]
    @release_year = data[:release_year]
  end

  def update(new_data)
    super
    @genre = data[:genre] unless new_data[:genre].nil?
    @title = new_data[:title] unless new_data[:title].nil?
    @executor = new_data[:executor] unless new_data[:executor].nil?
    @release_year = new_data[:release_year] unless new_data[:release_year].nil?
  end

  def to_s
    "Альбом #{@executor} - «#{@title}», #{@genre}, #{@release_year}, #{@price} руб. (осталось #{@quantity})"
  end
end

