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

Install and configure capistrano in your project. More information is on Capistrano [Home Page](http://capistranorb.com/) and Capistrano [GitHub](https://github.com/capistrano/capistrano)

Require capistrano-pimcore in your cap file

```
# Capfile
require 'capistrano-pimcore'
```

### Pimcore Specific Tasks

You can see this list by running `cap -T` from your shell.

| cap command                                | what it does                                         |
| ------------------------------------------ | ---------------------------------------------------- |
| pimcore:cache:clear                        | Flush Pimcore cache storage                          |
| pimcore:classmap-generator                 | Generate class maps to improve performance           |
| pimcore:definition:import:class            | Import Class definition from a JSON export           |
| pimcore:definition:import:fieldcollection  | Import FieldCollection definition from a JSON export |
| pimcore:definition:import:objectbrick      | Import ObjectBrick definition from a JSON export     |
| pimcore:deployment:classes-rebuild         | Rebuild Pimcore classes                              |
| pimcore:mysql-tools                        | Optimize and warmup mysql database                   |
| pimcore:reset-password                     | Reset Pimcore user password                          |
| pimcore:search-backend-reindex             | Re-indexes the backend search of pimcore             |
| pimcore:thumbnails:image                   | Generate Pimcore image thumbnails                    |
| pimcore:thumbnails:optimize-images         | Optimize Pimcore filesize of all images              |
| pimcore:thumbnails:video                   | Generate Pimcore video thumbnails                    |
| pimcore:update                             | Update pimcore to the desired version/build          |

### How work with Pimcore environments

Default environment is `development`. If you want to change Pimcore environment add param env as a param in CLI command, exapmle:

```bash
bundle exec cap test pimcore:cache:clear env=production
```

For each environment param env can be setted in config file, example:
```ruby
# /config/deploy/staging.rb
set :env, 'development'
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/DivanteLtd/capistrano-pimcore.
