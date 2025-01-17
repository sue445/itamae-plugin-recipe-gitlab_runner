# Itamae::Plugin::Recipe::GitlabRunner

Itamae plugin to install [GitLab Runner](https://docs.gitlab.com/runner/)

[![Gem Version](https://badge.fury.io/rb/itamae-plugin-recipe-gitlab_runner.svg)](https://badge.fury.io/rb/itamae-plugin-recipe-gitlab_runner)
[![test](https://github.com/sue445/itamae-plugin-recipe-gitlab_runner/actions/workflows/test.yml/badge.svg)](https://github.com/sue445/itamae-plugin-recipe-gitlab_runner/actions/workflows/test.yml)

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
include_recipe "gitlab_runner::register_gitlab_runner"
```

### Node

```yml
# node.yml
gitlab-runner:
  version: "10.0.0" # optional. Install latest version if omitted
```

### `register_gitlab_runner`
Register a gitlab_runner

* `name` (`String`)
  * runner name
* `options` (`Array`, `String`)
  * args for `gitlab-runner register`
  * `--non-interactive`, `--name` and `--description` are needless
  * c.f. https://docs.gitlab.com/runner/register/#one-line-registration-command
* `config` (`String`)
  * config file (default: `/etc/gitlab-runner/config.toml`)

e.g)

```ruby
register_gitlab_runner "docker-runner" do
  options [
            "--url", "https://gitlab.com/",
            "--registration-token", "PROJECT_REGISTRATION_TOKEN",
            "--executor", "docker",
            "--docker-image", "alpine:3",
            "--tag-list", "docker,aws",
            "--run-untagged",
            "--locked=false",
          ]
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Testing
requirements [Docker](https://www.docker.com/)

e.g) test on CentOS 7.0

```sh
bundle exec itamae docker --node-yaml=spec/recipes/node.yml spec/recipes/install.rb --image=centos:7 --tag itamae-plugin:latest
DOCKER_IMAGE=itamae-plugin:latest bundle exec rspec
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/sue445/itamae-plugin-recipe-gitlab_runner.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
