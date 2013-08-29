require 'active_model'

# Preciso aplicar DRY
# class Car
#   include ActiveModel::Validations
#   attr_accessor :model, :manufacturer, :year_fabrication
#   validates_presence_of :model, :manufacturer, :year_fabrication
# end

# class Rocket
#   include ActiveModel::Validations
#   attr_accessor :model, :manufacturer, :year_fabrication
#   validates_presence_of :model, :manufacturer, :year_fabrication
# end

# NEXT =>


module Manufactured
  # ainda assim não vai funcionar
  # é preciso aplicar para a propria class.. desse modo não está certo ainda
  # pois o SELF seria o módulo e não a classe
  # include ActiveModel::Validations
  # attr_accessor :model, :manufacturer, :year_fabrication
  # validates_presence_of :model, :manufacturer, :year_fabrication

  def self.included(target_class)
    target_class.class_eval do 
      include ActiveModel::Validations
      attr_accessor :model, :manufacturer, :year_fabrication
      validates_presence_of :model, :manufacturer, :year_fabrication
    end
  end
end

class Car
  include Manufactured
end

class Rocket
  include Manufactured
end

palio = Palio.new
p palio.valid?

rocket = Rocket.new
p rocket.valid?