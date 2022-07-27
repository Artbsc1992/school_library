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
      'a' => [age, name, parent_permission, specialization, id]
    }.to_json(*args)
  end

  def self.json_create(obj)
    person = new(obj['a'][0], obj['a'][1], obj['a'][2], parent_permission: obj['a'][3])
    person.id = obj['a'][4]
    person
  end
end
