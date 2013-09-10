# Monkey Patch
module Comparable
  #dispara o conteúdo desse método, toda vez qum módulo for incluido
  def self.included(other_mod)
    puts "#{other_mod} is now a comparable"
  end
end

class Money < Struct.new :currency, :amount
  # ao incluir esse módulo, irá disparar o hook
  include Comparable

  # agora ele sabe realizar as comparação sem precisa implementar todos os métodos.
  def <=>(other_money) 
    self.amount <=> other_money.amount
  end
end

# item_price   = Money.new '$', 99
# item_2_price = Money.new '$', 199

# p item_price < item_2_price

# como fazer essa comparação diretamente com os objetos ?
# item_price > item_2_price
# item_price < item_2_price
# item_price == item_2_price
# item_price >= item_2_price
# item_price <= item_2_price
