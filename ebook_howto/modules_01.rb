module Something
  def do_something
    puts "doing it..."
  end
end

class Nothing; include Something end
class OtherThing; include Something end;

# toda vez que se add um módulo ele aparece nos ancestors como uma superclasse

puts Nothing.ancestors.inspect
puts OtherThing.ancestors.inspect
puts "--"
puts Nothing.new.do_something
puts OtherThing.new.do_something

# para checar os módulos inclusos

puts Nothing.included_modules.inspect
puts OtherThing.included_modules.inspect

puts "--"

# o método #include irá add o método como uma superclasse de self.
# quando é necessário somente um obj extender/incluir método de um module, usar o método #extend

module Permalink
  def to_permalink
    self.downcase.gsub(" ", "-")
  end
end

title = "This is my title"
title.extend Permalink
other_title = "This is other title"

puts title.respond_to? :to_permalink # => true
puts title.to_permalink # => this-is-other-title
puts other_title.respond_to? :to_permalink # => false
