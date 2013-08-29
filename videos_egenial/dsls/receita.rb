# coding: utf-8
# STEP 1
class Receita

  def initialize(nome)
    @nome = nome
    @dados = {
      porcoes: nil,
      tempo: nil,
      preparo: [],
      ingredientes: {}
    }
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
    @dados.to_s
  end

end


receita = Receita.new 'Bolo'
receita.porcoes 2
receita.tempo 2
receita.ingrediente 'Farinha', '300 gramas'
receita.ingrediente 'Ovos', '3'
receita.preparo 'Leva no fogo'
receita.preparo 'Oléo a gosto'
receita.preparo 've bolinha'

print receita