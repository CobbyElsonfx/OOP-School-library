require './nameable'
require './rental'

class Person < Nameable
  attr_reader :id, :rentals
  attr_accessor :name, :age, :parent_permission

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @age = age
    @name = name
    @id = generate_id
    @parent_permission = parent_permission
    @rentals = [] # Initialize an empty array to store rentals
  end

  def of_age?
    age >= 18
  end

  def can_use_services?
    of_age? || parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(book, date)
    Rental.new(date, book, self)
  end

  private

  def generate_id
    timestamp = Time.now.to_i
    object_id_hex = (object_id << 1).to_s(16) # Shift left to make it positive
    "ID-#{timestamp}-#{object_id_hex}"
  end
end
