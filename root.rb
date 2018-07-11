require 'httparty'
require_relative 'user'

# module Destiny2API

class Destiny_2_API_Root
  include HTTParty
  format :json

  base_uri 'www.bungie.net/Platform'

  include User

  def initialize(api_key)
    @headers = {"x-api-key" => api_key,  "Content-Type" => "application/json" }
  end
end
# end
