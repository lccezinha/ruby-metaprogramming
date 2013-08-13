require 'RedCloth'
require 'rdiscount'

module Formatter
  class AbstractMethodError < StandardError; end
  class UnknownFormatterError < StandardError; end

  FORMATTERS = {
    textile: 'Formatter::Textile',
    markdown: 'Formatter::Markdown'
  }

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
