case node[:platform]
when "debian"
  # include_recipe "gitlab_runner::install::debian"

when "redhat"
  include_recipe "gitlab_runner::install::centos"
end
