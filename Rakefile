require "bundler/gem_tasks"

ENV["ITAMAE_CONTAINER"] ||= "itamae-plugin-dev"

namespace :itamae do
  itamae_command = "itamae docker --node-yaml=spec/recipes/node.yml spec/recipes/install.rb --container=#{ENV["ITAMAE_CONTAINER"]} --tag itamae-plugin:latest"

  desc "Run itamae"
  task :apply do
    sh itamae_command
  end

  desc "Run itamae (dry-run)"
  task :dry_run do
    sh "#{itamae_command} --dry-run"
  end
end

desc "Run serverspec"
task :spec do
  sh "DOCKER_CONTAINER=#{ENV["ITAMAE_CONTAINER"]} rspec"
end

task :default => ["itamae:apply", "spec"]
