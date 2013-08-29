class Money < Struct.new :currency, :amount
end

item_price   = Money.new '$', 99
item_2_price = Money.new '$', 199

# como fazer essa comparação diretamente com os objetos ?
item_price > item_2_price
item_price < item_2_price
item_price == item_2_price
item_price >= item_2_price
item_price <= item_2_price
