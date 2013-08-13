#included -> é executado quando um módulo é incluso em outro. Recebe o módulo que o inclui como argumento
module SomeModule
  def self.included(base)
    puts "including #{name} on #{base.name}"
  end
end

class SomeClass
  include SomeModule
end

# const_missing -> executado quando não encontra a constante. Recebe o nome da constante como arg.
class Object
  def self.const_missing(name)
    puts "Const: #{name} not found"
  end
end
Car

# extended -> É executado quando um objeto é estendido com um módulo. Ele receberá o objeto como argumento.
module OtherSomeModule
  def self.extended(object)
    puts "Extending: #{object.inspect}"
  end
end

object = Object.new
object.extend OtherSomeModule