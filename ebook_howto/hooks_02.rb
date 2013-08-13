# method_added -> executado toda vez que um método for adicionado a um objeto, recebe o nome do método com arg

class SomeClass
  def self.method_added(method)
    puts "new methods added: #{method}"
  end
  def hello
    puts "hello"
  end
end

# method_missing -> intercepta a chamada p/ quando o método não existir

class Finder
  def method_missing(method, *args)
    puts "Method: #{method} not found. Args: #{args.join(', ')}"
  end
end
finder = Finder.new
finder.find_by_name 'Luiz', 'Cezer'