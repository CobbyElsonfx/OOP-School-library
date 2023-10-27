require './person'
require './book'

class Rental
  attr_reader :person, :book, :date

  def initialize(person, book, date)
    @person = person
    @book = book
    @date = date

    person.rentals << self
    book.rentals << self
  end
end
