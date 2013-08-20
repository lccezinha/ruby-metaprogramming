class Human
  def self.population
    7_000_000_000
  end
end
puts Human.population # => 7_000_000_000

puts "\n---\n\n"
# mas desse modo não é possível atribuir um novo valor ->
# Human.population = 1_000_000_000 # => undefined method population=

# Não é possível criar um acessor para a classe, exemplo:
# class Human
#   self.attr_accessor :population => não existe
#   def self.population
#     7_000_000_000
#   end
# end

# resolução é abrir a Singleton class e criar o accessor

class Human
  class << self
    attr_accessor :population
  end
  def self.population
    7_000_000_000
  end
end

puts Human.population # => 7_000_000_000
puts Human.population = 1_000
puts Human.population # => 1_000

