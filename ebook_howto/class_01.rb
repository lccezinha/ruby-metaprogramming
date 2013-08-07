# classes dinâmicas não possuem nome ...
# o nome é inferido da constante ao qual ele foi atribuido

clazz = Class.new
puts clazz.name.inspect # => nil

MyClass = clazz
puts MyClass.name.inspect # => MyClass

# para definir a superclass se uma classe dinâmica é só parar a superclass como arg na instanciação

class Person; end
Author = Class.new(Person)
puts Author.ancestors.inspect # => trás um array que contem a classe Person

# para definir métodos desta classe, passar um bloco que será o corpo da classe

Customer = Class.new do 
  def self.say(message)
    puts message
  end
end
Customer.say("batata8") # => batata8
