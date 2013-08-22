#######################
# instance_eval

# Uso:  
# -> Trabalhar em cima de encapsulamento
# -> Injetar comportamento em instancias

#######################

# executado em cima de uma instância
# recebe um bloco
# executado no receiver

puts self
puts "ruby"

'ruby'.instance_eval do 
  puts self # => retorna'ruby'
end

##########################

class Superhero
  attr_accessor :name
  def initialize(name, nick)
    @name, @nick = name, nick
  end
private
  def reveal
    "the sp #{@name} is #{@nick}"
  end
end

@spiderman = Superhero.new 'Spiderman', 'Peter Parker'
# p @spiderman.reveal # => não executa pois private precisa de um receiver implicito.
# como o receiver passa a ser o objeto da classe ele fica implicito
@spiderman.instance_eval do 
  p reveal
end

@superman = Superhero.new 'Superman', 'Clark ~Quente~'
# puts @superman.fly! falha
@superman.instance_eval do 
  # adicionando um método de instância
  def fly!
    "--------------> flying!"
  end
end
puts @superman.fly!

puts

# Apesar de ser uma classe, Superhero é tbm uma instância de Class, 
# por isso é possível usar instance_eval
Superhero.instance_eval do
  def have_powers?
    true
  end
end
p Superhero.have_powers?