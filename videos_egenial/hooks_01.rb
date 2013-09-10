class Character
  @avaliable_plans = []

  def self.inherited(from_klass)
    @children ||= [] 
    @children << from_klass
  end

  def self.for_plan(condition)
    @children.find_all { |c| c.avaliable?(condition) }
  end

  def self.avaliable?(plan)
    @avaliable_plans.include? plan
  end

end

class Elf < Character
  @avaliable_plans = [:junior, :advanced, :master]
end

class Knight < Character
  @avaliable_plans = [:advanced, :master]
end

p Character.for_plan :master
p Character.for_plan :junior