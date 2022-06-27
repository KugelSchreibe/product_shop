require_relative 'Product'

class Book < Product
  attr_accessor :author, :genre, :title

  def self.from_file(path)
    file = File.new(path)

    # file = File.new(path, chomp: true) - у меня не работал chomp таким образом
    # поэтому использовал блок map
    data = file.readlines.map(&:chomp)
    file.close

    Book.new(title: data[0], genre: data[1], author: data[2], price: data[3],
              quantity: data[4])
  end

  def initialize(data)
    super
    @title = data[:title]
    @author = data[:author]
    @genre = data[:genre]
  end

  def update(new_data)
    super
    @author = new_data[:author] unless new_data[:author].nil?
    @genre = new_data[:genre] unless new_data[:genre].nil?
    @title = new_data[:title] unless new_data[:title].nil?
  end

  def to_s
    "Книга «#{@title}», #{@genre}, автор - #{@author}, #{@price} руб. (осталось #{@quantity})"
  end
end
