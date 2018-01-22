include_recipe 'sftp::default'

sftp_user 'foo' do
  password 'bar'
end
