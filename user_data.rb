class UserData
  attr_accessor :name, :age, :place

  def initialize(name: 'Unspecified', age: 'Unspecified', place: 'Unspecified')
    @name = name
    @age = age
    @place = place
  end

  def to_hash
    { 'name' => @name, 'age' => @age, 'place' => @place }
  end
end
