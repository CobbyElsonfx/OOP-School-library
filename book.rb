class Book
  attr_accessor :title, :author, :rentals

  def initialize(author, title)
    @author = author
    @title = title
    @rentals = [] # Initialize an empty array to store rentals
  end
end
