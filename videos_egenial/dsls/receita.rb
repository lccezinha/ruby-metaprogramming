# coding: utf-8

class Receita

  def initialize(nome, &block)
    @nome = nome
    @dados = {
      porcoes: nil,
      tempo: nil,
      preparo: [],
      ingredientes: {}
    }

    instance_eval &block
  end

  def porcoes(quantas)
    @dados[:porcoes] = quantas
  end

  def tempo(quanto)
    @dados[:tempo] = quanto
  end

  def preparo(instrucao)
    @dados[:preparo] << instrucao if instrucao
  end

  def ingrediente(nome, quantidade)
    @dados[:ingredientes][nome] = quantidade
  end

  def to_s
    string = <<-EOF
      Receita: #{@nome}
      Rendimento: #{@dados[:porcoes]} porções
      Tempo: #{@dados[:tempo]}
      Ingredientes:
        #{@dados[:ingredientes].map { |n, qtd| "#{n}: #{qtd}"  }.join("\n\t")}
      Preparo:
        #{@dados[:preparo].join("\n\t")}  
    EOF
  end

end

def receita(name, &block)
  Receita.new name, &block
end

def imprimir(receita)
  print receita
end

bolo = receita 'Bolo' do 
  porcoes 2
  tempo 2
  ingrediente 'Farinha', '300 gramas'
  ingrediente 'Ovos', '4'
  preparo 'Leva no fogo'
  preparo 'Óleo, muito óleo'
  preparo 've bolinha'
  preparo 'serve gosto.'
end

imprimir bolo

# receita = Receita.new 'Bolo' do |receita|
#   receita.porcoes 2
#   receita.tempo 2
#   receita.ingrediente 'Farinha', '300 gramas'
#   receita.ingrediente 'Ovos', '3'
#   receita.preparo 'Leva no fogo'
#   receita.preparo 'Oléo a gosto'
#   receita.preparo 've bolinha'
# end
