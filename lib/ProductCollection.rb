require_relative 'Book'
require_relative 'Movie'
require_relative 'Disk'

class ProductCollection
  def self.from_dir(path)
    dirs = Dir["/#{path}/movies/*"]
    movie_collection = dirs.map { |path| Movie.from_file(path) }

    dirs = Dir["/#{path}/books/*"]
    book_collection = dirs.map { |path| Book.from_file(path) }

    dirs = Dir["/#{path}/disks/*"]
    disk_collection = dirs.map { |path| Disk.from_file(path) }

    movie_collection + book_collection + disk_collection
  end

  def initialize(collection)
    @products = collection
  end

  def to_a()
    @products
  end

  def sort()
    @products.sort_by! { |product| [product.price, product.quantity] }
  end
end