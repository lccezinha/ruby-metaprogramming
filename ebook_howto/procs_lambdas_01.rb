# lambda -> fazem chegagem de argumentos
# Proc.new -> ignora

# são executaveis e não precisam de um receiver

hello = Proc.new { |message| puts message }
hello.call "LOL" # => "LOL"

hi = lambda { |message| puts message }
hi.call "WTF?" # => "WTF?"

# check args

args = ['hello', 'luiz']

first = Proc.new { |msg| puts msg }
# irá ignonar o argumento a mais ou a menos
first.call args # => hello

second = lambda { |msg, name| puts "#{msg}: #{name}" }
second.call args # => hello: luiz
second.call args.pop # => ArgumentException