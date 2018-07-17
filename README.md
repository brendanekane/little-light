# LittleLight
A prerequisite to using this gem is having a valid api-key from Bungie. Without an api-key you will not be able to call any methods successfully.

To start off you need to instantiate the Client and supply it with an api-key as a parameter.

client = LittleLight::Client("api-key")

Once you have instantiated the client you can call any methods in the lib folder on the client with the required parameters

ex/

client.search_bungie_net_by_username("robbinthehood") => returns an object with of all usernames containing the string "robbinthehood"

You can find all the methods available to use in the lib folder, along with comments about what you should expect it to return, required params, as well as some links to destiny api docs for certain params.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'little_light'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install little_light

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/little_light. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the LittleLight project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/little_light/blob/master/CODE_OF_CONDUCT.md).
