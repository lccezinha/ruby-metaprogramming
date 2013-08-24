require 'yaml'

class Garage

  def initialize
    @collection = YAML.load_file(File.join(File.dirname(__FILE__), 'cars.yml'))
  end

  def all
    @collection
  end

private
  # irá criar os finders dinâmicos
  def method_missing(method, *args, &block)
    # $1 é o que é retornado na Regex, pelo fato de usar ()
     if method =~ /find_by_(\w+)/
      @collection.find_all { |car| car[$1].eql? args.first }
    else
      # boa prática de method_missing é sempre ter um else com um super
      # para retornar uma exception caso de erro.
      super
    end
  end

end


garage = Garage.new
p garage.model 'Gol'