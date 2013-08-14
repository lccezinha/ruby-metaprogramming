#coding : utf-8
class Object
  def self.dsl_attr(name)
    class_eval <<-RUBY, __FILE__, __LINE__
    def #{name}(*args)
      @#{name} = args.first unless args.empty?
      @#{name}
    end
    RUBY
  end
end

class Recipe
  dsl_attr :name
  dsl_attr :description
  dsl_attr :ingredients
  dsl_attr :instructions
  
  def initialize(&block)
    @ingredients = []
    @instructions = []

    instance_eval &block if block_given?
    self
  end

  def to_text
    "".tap do |text|
      text << name
      text << "\n" << ("=" * name.size) << "\n"

      text << "\n" << description if description
      text << "\n"

      text << "\nIngredientes" << "\n-----------\n"
      text << ingredients.map { |ing| "- #{ing}\n" }.join("")

      text << "\nComo preparar" << "\n-----------\n"
      text << instructions.each_with_index.map { |item, index| "#{index + 1}. #{item}\n" }.join("")
    end
  end
end

# recipe = Recipe.new do 
#   self.name = 'Coca'
#   self.ingredients << 'Açucar'
#   self.ingredients << 'Sal'
#   self.ingredients << 'Muito corante'
#   self.ingredients << 'Coisas misteriosas'
# end

recipe = Recipe.new do 
  name 'LOL'
  description 'UMA BAGAÇA AE'

  ingredients << 'Uma meia'
  ingredients << '3 Colher'
  ingredients << '4 Pombas'

  instructions << 'Mexe tudo ve bolinha'
  instructions << 'Serve a gosto'
end

puts recipe.to_text