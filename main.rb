require_relative 'person'
require_relative 'student'
require_relative 'book'
require_relative 'classroom'
require_relative 'teacher'
require_relative 'rental'

class Display
  def initialize
    @people = []
    @books = []
    @rentals = []
  end
end