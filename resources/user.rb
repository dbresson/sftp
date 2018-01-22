propery :username, String, name_property: true
property :password, String

action :create do

  # Chroot dir
  directory File.join(node['sftp']['base_dir'], new_resource.username)

  user new_resource.username do
    home File.join('/', new_resource.username)
    password new_resource.password
  end

  # Home dir
  directory File.join(node['sftp']['base_dir'], new_resource.username, new_resource.username) do
    owner new_resource.username
    group new_resource.username
    mode '0700'
  end

  group "#{new_resource.username}-jailed" do
    group_name node['sftp']['group']
    members [new_resource.username]
    append true
  end
end
