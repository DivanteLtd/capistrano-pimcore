# Capistrano::Pimcore

Pimcore plugin for capistrano

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'capistrano-pimcore'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install capistrano-pimcore

## Usage

### How work with Pimcore environments

Default environment is `development` if you need change Pimcore environment add param env, exapmle:

```bash
bundle exec cap test pimcore:cache:clear env=production
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/DivanteLtd/capistrano-pimcore.
