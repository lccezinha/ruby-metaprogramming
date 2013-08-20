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