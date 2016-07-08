class UserData
  attr_accessor :name, :age, :place

  def initialize(details)
    @name = details['name']
    @age = details['age']
    @place = details['place']
  end

  def to_hash
    { 'name' => @name, 'age' => @age, 'place' => @place }
  end
end
