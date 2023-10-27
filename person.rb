require './nameable'
require './decorator'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, name = 'Uknown', parent_permission: true)
    super()
    @age = age
    @name = name
    @id = generate_id
    @parent_permission = parent_permission
  end

  private

  def generate_id
    timestamp = Time.now.to_i
    object_id_hex = (object_id << 1).to_s(16) # Shift left to make it positive
    "ID-#{timestamp}-#{object_id_hex}"
  end

  def of_age?
    age >= 18
  end

  public

  def can_use_services?
    of_age? || parent_permission
  end

  def correct_name
    @name
  end
end

person = Person.new(22, 'maximilianus')
person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
puts capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
puts capitalized_trimmed_person.correct_name
