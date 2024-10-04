class Student
  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def better_grade_than?(other_student)
    grade > other_student.grade
  end

  protected
  
  attr_reader :grade
end

joe = Student.new("Joe", 98)
bob = Student.new("Bob", 72)

p joe.better_grade_than?(bob)