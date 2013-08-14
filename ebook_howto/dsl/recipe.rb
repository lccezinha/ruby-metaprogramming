#coding : utf-8
class Recipe
  attr_accessor :name
  attr_accessor :description
  attr_accessor :ingredients
  attr_accessor :instructions
  
  def initialize(&block)
    @ingredients = []
    @instructions = []

    instance_eval &block if block_given?
    self
  end
end

recipe = Recipe.new do 
  self.name = 'Coca'
  self.ingredients << 'Açucar'
  self.ingredients << 'Sal'
  self.ingredients << 'Muito corante'
  self.ingredients << 'Coisas misteriosas'
end