=begin
sintaxe comum de acesso:

class << object
end

onde -object- é o objeto cuja classe Singleton você quer

=end

class Person
  class << self 
    def count
      @count ||= 0
    end
  end
end

# mesmo que 

class Person
  def self.count
    @count ||= 0
  end
end