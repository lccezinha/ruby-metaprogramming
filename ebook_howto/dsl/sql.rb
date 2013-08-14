# para criar interfaces fluentes, como por exemplo o AREL que permiter Class.select(...).where(...).order('...')
# é preciso sempre retornar o receiver após definir o attr.

class SQL < BasicObject
  # def select(fields)
  #   @select = fields
  #   self
  # end

  # def from(tables)
  #   @tables = tables
  #   self
  # end

  # def where(conditions)
  #   @where = conditions
  #   self
  # end

  %w(select from where includes).each do |method|
    class_eval <<-RUBY
      def #{method}(value)
        @#{method} = value
        self
      end
    RUBY
  end

  def to_sql
    "".tap do |query|
      query << "SELECT #{@select} FROM #{@tables} "
      query << "WHERE #{build_conditions}" if @where
    end
  end

  private

  def build_conditions
    @where.collect { |name, value| %[#{name} = "#{value}"]}.join(" AND ")
  end
end

sql = SQL.new
sql.select("*").from("users").where(:name => 'Cezinha')
puts sql.to_sql