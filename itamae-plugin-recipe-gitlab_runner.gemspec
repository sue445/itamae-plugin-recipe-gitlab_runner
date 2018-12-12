
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "itamae/plugin/recipe/gitlab_runner/version"

Gem::Specification.new do |spec|
  spec.name          = "itamae-plugin-recipe-gitlab_runner"
  spec.version       = Itamae::Plugin::Recipe::GitlabRunner::VERSION
  spec.authors       = ["sue445"]
  spec.email         = ["sue445@sue445.net"]

  spec.summary       = %q{Itamae plugin to install GitLab Runner}
  spec.description   = %q{Itamae plugin to install GitLab Runner}
  spec.homepage      = "https://github.com/sue445/itamae-plugin-recipe-gitlab_runner"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = spec.homepage
    spec.metadata["changelog_uri"] = "https://github.com/sue445/itamae-plugin-recipe-gitlab_runner/blob/master/CHANGELOG.md"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "itamae"

  spec.add_development_dependency "bundler", ">= 1.16"
  spec.add_development_dependency "docker-api"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "serverspec"
end
