# para executar métodos de modo dinâmico é possível utilizar o #send
# send(:method_name, *args)

class Person
  def say(message)
    puts message
  end
end

person = Person.new
person.send :say, "My Message" # => My Message

##########

# outro exemplo de execução dinâmica

class OtherPerson
  def initialize(name, age)
    @name, @age = name, age
  end
  def say_name
    puts @name
  end
  def say_age
    puts @age
  end
end

other_person = OtherPerson.new 'Luiz', 23
%w[name age].each { |method_name| other_person.send("say_#{method_name}") }

# => Luiz 
# => 23