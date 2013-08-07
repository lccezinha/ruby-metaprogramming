string = "IAI PIPOCA"
ztring = "Hello popcorn"

#método #to_yo só é valido para o objeto string

def string.to_yo
  self.gsub("IAI", "EAE")
end

puts string.to_yo # => puts msg
puts ztring.respond_to? :to_yo # => false
puts "--"
puts string.singleton_methods.inspect # => ['to_yo']
puts ztring.singleton_methods.inspect # => []