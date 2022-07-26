require './person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(age, name, parent_permission, specialization)
    super(age, name, parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'a' => [age, specialization, name, parent_permission, id, rentals]
    }.to_json(*args)
  end

  def self.json_create(object)
    person = new(object['a'][0], object['a'][1], object['a'][2], parent_permission: object['a'][3])
    person.id = object['a'][4]
    person.rentals = object['a'][5]
    person
  end
end
