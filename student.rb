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
      'a' => [age, classroom, name, parent_permission, id, rentals]
    }.to_json(*args)
  end

  def self.json_create(object)
    person = new(object['a'][0], object['a'][1], object['a'][2], parent_permission: object['a'][3])
    person.id = object['a'][4]
    person.rentals = object['a'][5]
    person
  end
end
