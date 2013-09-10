class SuperHero

  # retorna para qualquer definição de metódo
  # toda vez que encontra uma linha ele dispará
  def self.method_added(method_name)
    p "new method_name added: #{method_name}"
  end

  def initialize(name, powers)
    @name, @powers = name, powers
  end

  attr_accessor :powers, :name

  define_method :fly do 
    p "I'am flying"
  end
end
