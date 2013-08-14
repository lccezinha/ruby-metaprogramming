module MyLib
  def self.configure(&block)
    yield Config
  end

  module Config
    class << self
      attr_accessor :name
      attr_accessor :description
    end
  end
end

MyLib.configure do |config|
  config.name = 'LoL Module'
  config.description = ' BLABLBLA'
end