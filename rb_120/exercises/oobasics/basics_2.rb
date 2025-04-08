class Cat
  attr_accessor :name
  @@num_of_cats = 0

  def initialize(name)
    @name = name
    @@num_of_cats += 1
  end

  def rename(name)
    self.name = name
  end
  
  def self.generic_greeting
    p "Hello. I'm a cat!"
  end

  def personal_greeting
    p "Hello. My name is #{name}."
  end
  
  def self.total
    p @@num_of_cats
  end
  
  def greet
    p "My name is #{name} and I'm a #{COLOR} cat."
  end
  
  def to_s
    "I'm #{name}."
  end
end


Cat.generic_greeting

kitty = Cat.new

kitty.class.generic_greeting


kitty = Cat.new('Sophie')
p kitty.name
kitty.rename('Chloe')
p kitty.name


kitty = Cat.new('Sophie')

Cat.generic_greeting
kitty.personal_greeting

Cat.total
kitty.greet

puts kitty