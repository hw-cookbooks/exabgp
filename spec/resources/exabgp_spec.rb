require 'spec_helper'

describe 'exabgp' do
  cached(:chef_run) do
    ChefSpec::SoloRunner.new(step_into: ['exabgp']).converge('exabgp_test::package')
  end

  it 'calls the exabgp resource with the name package' do
    expect(chef_run).to install_exabgp('package')
  end

  it 'installs the exabgp package through python pip' do
    expect(chef_run).to install_python_package('exabgp')
  end

  it 'creates a configuration directory with the installation name attached' do
    expect(chef_run).to create_directory('/etc/exabgp-package')
  end

  it 'creates a default template in the config directory' do
    expect(chef_run).to create_template('/etc/exabgp-package/exabgp.conf')
  end
end
