define :register_gitlab_runner, options: [], config: "/etc/gitlab-runner/config.toml" do
  runner_name = params[:name]
  config_file = params[:config]

  raise "name is required. (e.g. register_gitlab_runner 'your_runner_name')" unless runner_name

  register_args = ["--non-interactive", "--name", runner_name, "--config", config_file] + Array(params[:options])
  register_args.compact!

  execute "gitlab-runner register #{register_args.join(" ")}" do
    not_if "gitlab-runner list --config #{config_file} 2>&1 1>/dev/null | grep '#{runner_name}'"
  end
end
