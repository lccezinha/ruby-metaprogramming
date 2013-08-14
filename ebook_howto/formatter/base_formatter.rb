require 'RedCloth'
require 'rdiscount'

module Formatter
  class AbstractMethodError < StandardError; end
  class UnknownFormatterError < StandardError; end

  FORMATTERS = {}

  def self.format(type, content)
    formatter_name = FORMATTERS[type.to_sym]
    raise UnknownFormatterError unless formatter_name

    formatter = eval(formatter_name)
    formatter.new(content).to_html
  end

  class Base
    attr_accessor :content

    def initialize(content)
      @content = content
    end

    def to_html
      raise Formatter::AbstractMethodError
    end



    def self.inherited(child)
      type = child.name.split("::").last.downcase.to_sym
      Formatter::FORMATTERS[type] = child.name

      Formatter.class_eval <<-RUBY, __FILE__, __LINE__
       def self.#{type}(content)
          format :#{type}, content
       end
      RUBY
    end
  end

  end

  class Textile < Base
    def to_html
      RedCloth.new(content).to_html
    end
  end

  class Markdown < Base
    def to_html
      RDiscount.new(content).to_html
    end
  end
end

puts Formatter.format :textile, "h1, Ruby LOL"
puts Formatter.format :markdown, "# Ruby LOL"
