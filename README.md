# Warcraft

[![Gem Version](https://badge.fury.io/rb/warcraft.svg)](https://badge.fury.io/rb/warcraft)

⚠️ **This gem is still a work-in-progress and is likely not usable**

A Ruby wrapper for the World of Warcraft Profile and Game Data APIs

_Warcraft is a registered trademark of Blizzard Entertainment, Inc. I am in no way affiliated with Blizzard Entertainment._

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'warcraft'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install warcraft

## Usage

```ruby
# Instantise the client
client = Warcraft::Client.new(access_token, :eu)
# Get a character profile
client.character(character_name: 'Jiu', realm: 'Magtheridon').profile
# Get a character's achievements
client.character(character_name: 'Jiu', realm: 'Magtheridon').achievements
# Get characters of an authenticated Battle.net user
client.account(token: user_token).profile.all_characters
```

## Development

After checking out the repo, run `bundle install` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/raccube/warcraft. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/raccube/warcraft/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the project's codebase, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/raccube/warcraft/blob/master/CODE_OF_CONDUCT.md).
