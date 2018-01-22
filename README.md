# sftp

The sftp cookbook sets up a chrooted SFTP server for users.

To use, include the sftp::default recipe and use the `sftp_user` resource, i.e.

`sftp_user 'foo' do

  password 'bar'

end`

