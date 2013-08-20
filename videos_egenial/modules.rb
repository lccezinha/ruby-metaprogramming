# modules são usados como:
# -> namespaces:
# # -> Net::Http, ActiveRecord::Base

# -> métodos globais ( não é necessário instanciar uma classe pra ter o valor do método)
# # -> Math::PI

# -> mixins ( simular herança )

module Dancer
  def dance; puts "\\o/ _o_ \\o_" end
end

class Human
  include Dancer
end

class Monkey
  include Dancer
end

human = Human.new
human.dance

monkey = Monkey.new
monkey.dance

####################
# OBS:
# usando o HACK com 'class << self' os métodos ficam com um comporatemento de métodos de instância
# usando extend: tem um comportamento de métodos de classe
####################

module Census
  # dessa maneira, se houver uma inclusão em qualquer classe, o self SEMPRE SERÁ o módulo Census
  # def self.population=(value)
  #   @population = value
  # end
  # def self.population
  #   @population
  # end
  # def population=(value)
  #   @population = value
  # end
  # def population
  #   @population
  # end
  attr_accessor :population
end

class Alien 
  #include Census
  # cai no problema acima
  # é preciso abrir o self da classe
  # é um HACK
  # class << self
  #   include Census
  # end
  # deve ser trocado por extend
  extend Census
end

class Human
  #include Census
  # cai no problema acima
  # é preciso abrir o self da classe
  # é um HACK
  # class << self
  #   include Census
  # end
  # deve ser trocado por extend
  extend Census
end

Human.population = 10000
Alien.population = 5000 

puts Human.population
puts Alien.population
