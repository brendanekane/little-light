require "little_light/version"
require 'little_light/client'
require 'little_light/user'
require 'little_light/clan'
require 'little_light/vendor'

module LittleLight
  def self.new(options={})
    LittleLight::Client.new(options)
  end
end
