# user & para capturar um block

def my(&block)
  puts block.call
end
my { "Hello" } # => hello

#####

# nesse caso o &block é obrigatório como arg do método
def say(&block)
  if block_given?
    puts block.call
  else
    puts "no block"
  end
end

say # => no block 
say { "VISH" } # => VISH

# nesse caso &block é opcional

def say
  if block_given?
    yield
  else
    puts "no bloc"
  end
end