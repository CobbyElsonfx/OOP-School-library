class Person
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, name: 'Unknown', parent_permission: true)
    @age = age
    @name = name
    @id = generate_id
    @parent_permission = parent_permission
  end

  private

  def generate_id
    timestamp = Time.now.to_i
    object_id_hex = (object_id << 1).to_s(16)
    "ID-#{timestamp}-#{object_id_hex}"
  end

  def of_age?
    age >= 18
  end

  public

  def can_use_services?
    of_age? || parent_permission
  end
end
