# Module#class_eval Module#instance_eval alteram o contexto para self

# usando #class_eval para criar métodos de instancia
class Person; end
person = Person.new
puts person.respond_to? :say # => false

Person.class_eval do 
  def say
    puts "balbalbalbalbalbalba..."
  end
end
puts person.respond_to? :say # => true
puts person.say

# usando #class_eval para criar métodos de classe

class Car; end
puts Car.respond_to? :vrum # => false

Car.class_eval do 
  def self.vrum
    puts "VRUUUUUUUUUUUUUM..."
  end
end

puts Car.respond_to? :vrum # => true
puts Car.vrum

