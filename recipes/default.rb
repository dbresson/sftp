#
# Cookbook:: sftp
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

group node['sftp']['group']

directory node['sftp']['base_dir'] do
  recursive true
end

node.default['sshd']['sshd_config']['Match']["Group #{node['sftp']['group']}"] = {
  'X11Forwarding' => 'no',
  'AllowTcpForwarding' => 'no'
  'ChrootDirectory' => File.join(node['sftp']['base_dir'], '%u'),
  'ForceCommand' => 'internal-sftp'
}

include_recipe 'sshd:default'
