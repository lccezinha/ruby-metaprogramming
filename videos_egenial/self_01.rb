h = Class.new
puts h # => instância de Class
puts h.class # => Class

human = h
luiz = human.new 
puts luiz.class # => continua sendo uma instância de Class

####

Human = h 
luiz = Human.new
puts luiz.class # => instância de Human
# nome de uma classe é o nome da constante que armazena a ref da instância

