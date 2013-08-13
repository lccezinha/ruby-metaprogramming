# constantes são definidas com a 1 letra maiuscula e podem existir com mesmo nome em diferentes namespaces

module Car
  SOUND = 'VRUMMMMMM'
  class TuningCar
    SOUND = 'VRUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUM'
  end
end

puts Car::SOUND # => 'VRUMMMMMM'
puts Car::TuningCar::SOUND  # => 'VRUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUM'

# retornando as constantes definidas em um namespace
puts Car.constants

#verificando se uma constante existe
puts Car.const_defined? 'SOUND' # => true

#para pegar a referencia da constante 
puts Car.const_get 'SOUND' # => Car::SOUND

#setar valor dinâmicamente
Car.const_set 'NEW_SOUND', 'POPOPOPOP'
puts Car.const_get 'NEW_SOUND' if Car.const_defined? 'NEW_SOUND'
