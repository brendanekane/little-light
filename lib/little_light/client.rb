require 'httparty'
require_relative 'user'
require_relative 'clan'
module LittleLight
  class Client
    include HTTParty
    format :json

    base_uri 'www.bungie.net/Platform'

    include User
    include Clan

    def initialize(api_key)
      @headers = {"x-api-key" => api_key,  "Content-Type" => "application/json" }
    end
  end
end
