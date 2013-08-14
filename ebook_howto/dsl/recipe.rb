class Recipe
  attr_accessor :name
  attr_accessor :description
  attr_accessor :ingredients
  attr_accessor :instructions
  
  def initialize
    @ingredients = []
    @instructions = []
  end

end