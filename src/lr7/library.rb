class Book
  attr_reader :title, :author, :num_pages

  def initialize(title, author, num_pages)
    @title = title
    @author = author
    @num_pages = num_pages
    @taken = false
  end

  def taken?
    @taken
  end

  def take
    raise 'Book already taken' if taken?
    self.taken = true
    self
  end

  private

  attr_writer :taken
end

class Reader
  attr_reader :name, :id, :books

  def initialize(name, id)
    @name = name
    @id = id
    @books = []
  end

  def has_books?
    !books.empty?
  end

  def take_book(book)
    self.books << book
    self
  end

  private

  attr_writer :books
end

class Library
  def initialize(books)
    @books = books
  end

  def take_book(reader, book_title, book_author = nil)
    raise 'No books in library' if free_books.empty?

    book = free_books
      .select { |b| b.title == book_title }
      .then do |books|
        if book_author
          books.select { |b| b.author == book_author }
        else
          books
        end
      end
      .then(&:first)

    p book

    [book.take, reader.take_book(book)]
  end

  def books
    @books.sort_by { |b| [b.title, b.author] }
  end

  def taken_books
    books.select(&:taken?)
  end

  def free_books
    books.reject(&:taken?)
  end
end

books = [
  Book.new('Золотой ключик', 'А. Н. Толстой', 160),
  Book.new('Три толстяка', 'Ю. К. Олеша', 192),
  Book.new('Три толстяка', 'Некий другой автор', 228),
]

library = Library.new(books)

reader = Reader.new('Кирилл Кучеров', 'kkucherov@bmstu.ru')

library.take_book(reader, 'Три толстяка')

puts library.taken_books
puts ''
puts library.free_books
puts ''

puts books[1].taken?
puts books[2].taken?
