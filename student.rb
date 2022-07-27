require './person'

class Student < Person
  attr_reader :classroom

  def initialize(age, name, parent_permission, classroom = nil)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.student.include?(self)
  end

  def play_hooky?
    "¯\(ツ)/¯"
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'a' => [age, name, parent_permission, classroom, id]
    }.to_json(*args)
  end

  def self.json_create(obj)
    person = new(obj['a'][0], obj['a'][1], obj['a'][2], obj['a'][3])
    person.id = obj['a'][4]
    person
  end
end
