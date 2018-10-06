case node[:platform]
when "debian"
  execute "apt-get update"

when "redhat", "amazon"
  node["gitlab-runner"][:version] << "-1"
end

include_recipe "gitlab_runner"
