class Person
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, id, name: 'Unknown', parent_permission: true)
    @age = age
    @name = name
    @id = id
    @parent_permission = parent_permission
  end

  private

  def of_age?
    age >= 18
  end

  public

  def can_use_services?
    of_age? || parent_permission
  end
end
