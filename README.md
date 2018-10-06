# Itamae::Plugin::Recipe::GitlabRunner

Itamae plugin to install [GitLab Runner](https://docs.gitlab.com/runner/)

[![Build Status](https://travis-ci.org/sue445/itamae-plugin-recipe-gitlab_runner.svg?branch=master)](https://travis-ci.org/sue445/itamae-plugin-recipe-gitlab_runner)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'itamae-plugin-recipe-gitlab_runner'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install itamae-plugin-recipe-gitlab_runner

## Usage

```ruby
# recipe.rb
include_recipe "gitlab_runner"
```

Or `include_recipe` just what you need manually:

```ruby
include_recipe "gitlab_runner::install"
```

After, you need to register a runner

https://docs.gitlab.com/runner/register/index.html

### Node

```yml
# node.yml
gitlab-runner:
  version: "10.0.0" # optional. Install latest version if omitted
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Testing
requirements [Docker](https://www.docker.com/)

e.g) test on CentOS 7.0

```sh
docker run --privileged -d --name itamae-plugin-dev centos:7 /sbin/init
bundle exec rake itamae:apply spec
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/sue445/itamae-plugin-recipe-gitlab_runner.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
