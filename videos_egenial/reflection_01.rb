class Superhero
  def initialize(name, *powers)
    @name, @powers = name, powers
  end
  def fight
    "Fight w/ your powers: #{powers.join(', ')}"
  end
end

@ironman = Superhero.new 'Tony Stark', :fry, :infrared, :speed

puts @ironman.class
puts @ironman.instance_methods