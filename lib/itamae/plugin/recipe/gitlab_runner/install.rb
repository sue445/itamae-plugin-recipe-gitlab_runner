case node[:platform]
when "debian"
  include_recipe "gitlab_runner::install::deb"

when "redhat", "amazon"
  include_recipe "gitlab_runner::install::rpm"
end
