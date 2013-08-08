class Object
  def self.dsl_attr(name)
    class_eval <<-RUBY, __FILE__, __LINE__
    def #{name}(*args)
      @#{name} = args.first unless args.empty?
      @#{name}
    end
    RUBY
  end
end

class Person
  dsl_attr :name
  dsl_attr :age
  dsl_attr :email

  def self.from_file
    source = open(File.expand_path("./aboutme")).read
    person = new
    eval source, person.instance_eval { binding }
    person
  end
end

person = Person.from_file
puts person.name 
puts person.age
puts person.email
