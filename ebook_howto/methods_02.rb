# é possível definir métodos atráves do Monkey Patch 

class Person; end
class Person
  def name
    puts "Luiz"
  end
end

# ou com #define_method(method_name, &block)
# define_method recebe o nome do método e o bloco que formada o corpo do método
# irá criar métodos de instancia na classe.

class Person
  define_method :scream do |arg|
    say(arg)
  end
private
  def say(msg)
    puts msg.upcase
  end
end

person = Person.new
puts Person.respond_to? :scream # => false
puts person.respond_to? :scream # => true
person.scream "luizs" # => LUIZS

puts "\n--\n"

# para criar métodos de classe é preciso executar #define_method na classe Singleton

class Person
  class << self
    define_method :cry do
      puts "mimimimimimi..."
    end
  end
end

person = Person.new
puts Person.respond_to? :cry # => true
puts person.respond_to? :cry # => false
Person.cry # => mimimimim
