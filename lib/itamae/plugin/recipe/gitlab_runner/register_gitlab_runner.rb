define :register_gitlab_runner, options: [] do
  runner_name = params[:name]

  raise "name is required. (e.g. register_gitlab_runner 'your_runner_name')" unless runner_name

  register_args = ["--non-interactive", "--name", runner_name] + Array(params[:options])
  register_args.compact!

  execute "gitlab-runner register #{register_args.join(" ")}" do
    not_if "gitlab-runner list | grep '#{runner_name}'"
  end
end
