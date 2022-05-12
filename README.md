# Wordcheat

This is a ruby command line utility for cheating a Wordl and Spelling Bee. 


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'wordcheat'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install wordcheat

## Usage

When installed as a gem it takes command line arguments and, given a file containing a list of words, returns a list of those words that match the criteria.

```
Usage: wordcheat [options]
    -f, --file=PATH                  Path to a line delimited list of words (./words.txt is default)
    -p, --pattern=PATTERN            Words must match the exact pattern using '_' for unknown spaces and letters for known spaces (e.g. 'b_dg_r')
    -n, --length=LENGTH              Words much match the length given
    -g, --at-least=LENGTH            Words much be at least length letters
    -m, --must=CHARS                 Words must include the given letters
    -x, --must-not=CHARS             Words must not include the given letters
    -o, --only=CHARS                 Words must only use the letters given
    -h, --help                       Display this screen
```

Example:

If you had a Wordl game where you knew that the third leter was 'A' and had to include a 'C' and a 'V' you could run:

```
wordcheat -p __A__ -w CV
```

And you would get a list of words including the word "crave".

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/wordcheat. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/wordcheat/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Wordcheat project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/wordcheat/blob/main/CODE_OF_CONDUCT.md).
