# self é o receiver padrão para chamada de métodos
# toda chamada de método, ruby verifica se o mesmo existe no receiver padrão -self- ...
# ...ao menos que ele seja explicitamente informado
# self também armazena as variavéis de instancia do objeto

puts self # => main

class Bla
  puts self # => Bla
  def say
    puts self # => Bla.new (instancia)
    puts "saying..."
  end
  def self.hello
    puts self # => Bla
    puts "hello..."
  end
  puts self # => Bla
end
puts self # => main

bla = Bla.new
bla.say
Bla.hello


