case node[:platform]
when "redhat"
  node["gitlab-runner"][:version] << "-1"
end

include_recipe "gitlab_runner"
