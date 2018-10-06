describe package("gitlab-runner") do
  it { should be_installed }
end

describe service("gitlab-runner") do
  it { should be_enabled }
  it { should be_running }
end
