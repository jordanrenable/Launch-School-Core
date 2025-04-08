module Walkable
  def walk
    p "Let's go for a walk."
  end
end

class Cat
  def initialize(name)
    @name = name
  end

  attr_accessor :name

  def greet
    p "My name is #{name}."
  end

  include Walkable
end

kitty = Cat.new("Sophie")
kitty.greet
kitty.name = "Luna"
kitty.greet
kitty.walk