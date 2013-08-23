# class_eval == module_eval
# class_eval apenas classes

# Supondo que é preciso extender uma classe de uma gem
# é possível usar class eval para abrir a classe e adicionar métodos
# só roda em instancias das classe Class
# adiciona comporamento em todas as instâncias

class Superhero
end

Superhero.class_eval do 
  # se comporta como método de instancia
  def fight!
    "pow!! bang?? pow!!"
  end
end

puts Superhero.fight! # => undefined
# @batman = Superhero.new
# puts @batman.fight! # => "pow!! bang?? pow!!"