require 'httparty'
require_relative 'user'
require_relative 'clan'
require_relative 'vendor'

module LittleLight
  class Client
    include HTTParty
    format :json

    base_uri 'www.bungie.net/Platform'

    include User
    include Clan
    include Vendor

    def initialize(api_key)
      @headers = {"x-api-key" => api_key,  "Content-Type" => "application/json" }
    end
  end
end
