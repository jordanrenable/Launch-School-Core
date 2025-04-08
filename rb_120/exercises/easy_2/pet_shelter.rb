class Shelter
  def initialize
    @owners = {}
    @available_pets = []
  end

  def adopt(owner, pet)
    owner.pets << pet
    @owners[owner] = owner.pets
    available_pets.delete(pet)
  end

  def print_adoptions
    owners.each_key do |owner|
      p "#{owner.name} has adopted the following pets:"
      puts owner.pets
    end
  end
  
  def print_unadopted_number
    p "The Animal Shelter has #{available_pets.size} unadopted pets."
  end

  def print_unadopted_names
    p "The Animal Shelter has the following unadopted pets:"
    puts available_pets
  end

  attr_reader :available_pets, :owners
end

class Pet
  def initialize(type, name, shelter)
    @type = type
    @name = name
    shelter.available_pets << self
  end
  
  def to_s
    "a #{type} named #{name}"
  end

  attr_reader :type, :name

end

class Owner
  def initialize(name)
    @name = name
    @pets = []
  end

  def number_of_pets
    pets.size
  end

  attr_reader :name, :pets
end

shelter = Shelter.new

butterscotch = Pet.new('cat', 'Butterscotch', shelter)
pudding      = Pet.new('cat', 'Pudding', shelter)
darwin       = Pet.new('bearded dragon', 'Darwin', shelter)
kennedy      = Pet.new('dog', 'Kennedy', shelter)
sweetie      = Pet.new('parakeet', 'Sweetie Pie', shelter)
molly        = Pet.new('dog', 'Molly', shelter)
chester      = Pet.new('fish', 'Chester', shelter)

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter.print_unadopted_names
shelter.print_unadopted_number

shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)

puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."

roxie = Pet.new('dog', "Roxanne", shelter)
hael = Pet.new('dog', "Hael", shelter)
brick = Pet.new('cat', "Brick", shelter)
jable = Owner.new('J Able')
shelter.adopt(jable, roxie)
shelter.adopt(jable, hael)
shelter.adopt(jable, brick)

shelter.print_adoptions

shelter.print_unadopted_names
shelter.print_unadopted_number