case node[:platform]
when "debian"
  execute "apt-get update"

when "redhat", "amazon"
  if node.dig("gitlab-runner", "version")
    node["gitlab-runner"][:version] << "-1"
  end
end

include_recipe "gitlab_runner"
