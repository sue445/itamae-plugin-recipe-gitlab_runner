# c.f. https://docs.gitlab.com/runner/install/linux-repository.html

package "curl"

case node[:platform]
when "debian"
  execute "curl -L https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh | bash" do
    not_if "ls /etc/apt/sources.list.d/runner_gitlab-runner.list"
  end

when "redhat", "amazon"
  execute "curl -L https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.rpm.sh | bash" do
    not_if "ls /etc/yum.repos.d/runner_gitlab-runner.repo"
  end
end

gitlab_runner_version =
  if node["gitlab-runner"]
    node["gitlab-runner"][:version]
  else
    nil
  end

package "gitlab-runner" do
  if gitlab_runner_version
    version gitlab_runner_version
  end
end
