# defindo método dinamicamente com class_eval

class Person; end

Person.class_eval do 
  %w[name age phone].each do |field|
    define_method field do |*args|
      instance_variable_set "@#{field}", args.first unless args.emtpy?
      instance_variable_get "@#{field}"
    end
  end 
end

# pode ser subsituido por:

class Person
  %w[name age phone].each do |field|
    class_eval <<-RUBY, __FILE__, __LINE__
      def #{field}(*args)
        @#{field} = args.first unless args.empty?
        @#{field}   
      end
    RUBY
  end
end

# __FILE__ & __LINE__ são usados no #source_location e também para mensagens de erro.