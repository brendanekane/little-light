Gem::Specification.new do |s|
  s.name        = 'Little-Light'
  s.version     = '0.1.0'
  s.executables << 'little_light'
  s.licenses    = ['MIT']
  s.summary     = "Ruby Wrapper for Destiny 2 API"
  s.description = "A wrapper written in Ruby to query Bungie.net's Destiny 2 API"
  s.authors     = ["Brendan Kane"]
  s.email       = 'brendanekane@example.com'
  s.files = Dir['lib/   *.rb'] + Dir['bin/*']
  s.files += Dir['[A-Z]*'] + Dir['test/**/*']
  s.files.reject! { |fn| fn.include? "CVS" }
  s.homepage    = 'https://rubygems.org/gems/littlelight'
  s.metadata    = { "source_code_uri" => "https://github.com/brendanekane/little_light" }
end
