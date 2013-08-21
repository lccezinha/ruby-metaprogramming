# blocos não são objetos por padrão

# comportamento = lambda {
#   puts "LOL"
# }
# MESMO QUE
# comportamento = proc {
#   puts "LOL"
# }
# MESMO QUE
comportamento = Proc.new { 
  puts "LOL"
}
comportamento.call 

# lambdas fazem checagem de argumentos
# lambdas parecem muito com métodos normais
# Proc.new nãz, ele ignora as sobras e deixa nil os faltantes

# SÃO CLOSURES
# ou seja, carregam o escopo onde estão consigo

def action
  "The Action is : #{yield}"
end

employee = "James Hetfield"
boss     = "Dave Mustaine"

# se fosse feito da seguinte forma, daria erro pois 'boss' e 'emplooy' tem um escopo local dentro do método, ou seja seriam nil
# def 
#   p action "#{employee} is better than #{boss}"
# end

# o correto é utilizar procs como closures
# irão carregar o seu escopo atual junto executando o método corretamente, 
# junto com os valores das vars

#p action { "#{employee} is better than #{boss}" }



