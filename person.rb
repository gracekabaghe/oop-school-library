require_relative './corrector'
require_relative './rental'

class Person
  attr_accessor :age, :name, :rentals, :parent_permission
  attr_reader :id

  def initialize(age = 18, name = 'Jane Doe', parent_permission = 1)
    @id = Random.rand(1..2000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @corrector = Corrector.new
    @rentals = []
  end

  def add_rental(book, date)
    Rental.new(book, date, self)
  end

  private

  def ofage?
    return true unless age < 18
  end

  public

  def use_services?
    return true if ofage? || parent_permission
  end

  def validate_name
    @name = @corrector.correct_name(name)
  end
end

person = Person.new(60, 'gracewdfvcs')
person.validate_name

puts person.name
