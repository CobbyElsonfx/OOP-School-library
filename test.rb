require 'date'
require './person'
require './student'
require './teacher'
require './book'
require './rental'



def test_list_all_books
  # Create some books
  book1 = Book.new('Author1', 'Title1')
  book2 = Book.new('Author2', 'Title2')
  book3 = Book.new('Author3', 'Title3')

  # Add books to a list
  books = [book1, book2, book3]

  # List all books
  puts 'List of Books:'
  books.each do |book|
    puts "#{book.title} by #{book.author}"
  end
end

# Test 2: List all people
def test_list_all_people
  # Create some people (teachers and students)
  teacher1 = Teacher.new(35, 'Math', 'Jane Doe')
  student1 = Student.new(18, 'A101', 'Alice')
  student2 = Student.new(19, 'A102', 'Bob')

  # Add people to a list
  people = [teacher1, student1, student2]

  # List all people
  puts 'List of People:'
  people.each do |person|
    puts "#{person.name}, Age: #{person.age}"
  end
end

# Test 3: Create a person
def test_create_person
  # Create a person with age, name, and parent permission
  person = Person.new(25, 'John Doe', false) # Change 'false' to 'true' if they have parent permission
  puts "Created Person: #{person.name}, Age: #{person.age}, Parent Permission: #{person.parent_permission}"
end

# Test 4: Create a book
def test_create_book
  book = Book.new('Author4', 'Title4')
  puts "Created Book: #{book.title} by #{book.author}"
end

# Test 5: Create a rental
def test_create_rental
  # Create a person and a book
  person = Person.new(25, 'David')
  book = Book.new('Author5', 'Title5')

  # Create a rental
  rental = Rental.new(person, book, Date.new(2023, 10, 26))
  puts "#{person.name} rented the book '#{book.title}' on #{rental.date}"
end

# Test 6: List all rentals for a given person
def test_list_rentals_for_person
  # Create people and rentals
  person1 = Person.new(25, 'David')
  person2 = Person.new(30, 'Jane')
  book1 = Book.new('Author6', 'Title6')
  book2 = Book.new('Author7', 'Title7')
  Rental.new(person1, book1, Date.new(2023, 10, 26))
  Rental.new(person2, book1, Date.new(2023, 11, 1))
  Rental.new(person1, book2, Date.new(2023, 11, 5))

  # List rentals for a specific person
  puts "Rentals for #{person1.name}:"
  person1.rentals.each do |rental|
    puts "#{rental.book.title} - Date: #{rental.date}"
  end
end

# Test 7: Create a person
def test_create_person_types
  # Create a teacher
  teacher = Teacher.new(30, 'Science', 'John Smith')
  puts "Created Teacher: #{teacher.name}, Age: #{teacher.age}, Subject: #{teacher.specialization}"

  # Create a student
  student = Student.new(17, 'A103', 'Charlie')
  puts "Created Student: #{student.name}, Age: #{student.age}, Classroom: #{student.classroom}"
end

# Run the test cases
test_list_all_books
test_list_all_people
test_create_person
test_create_book
test_create_rental
test_list_rentals_for_person
test_create_person_types
