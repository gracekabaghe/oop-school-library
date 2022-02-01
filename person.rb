require_relative './corrector'

class Person
  attr_accessor :id, :name, :age

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name.capitalize
    @age = age
    @parent_permission = parent_permission
    @corrector = Corrector.new
  end

  def validate_name
    @name = @corrector.correct_name(name)
  end

  private :of_age?

  def of_age?
    @age >= 18
  end

  def can_use_services?
    of_age? || parent_permission == true
  end
end

person = Person.new(60, 'gracewdfvcs')
person.validate_name

puts person.name
