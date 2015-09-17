server   '54.92.121.123',
  user:  'tomajax',
  roles: %w{app db web},
  ssh_options: {
    keys: [
      # for ec2
      File.expand_path('~/.ssh/tomajax'),
      # for github
      File.expand_path('~/.ssh/id_rsa')
    ],
    forward_agent: true,
    auth_methods: %w(publickey)
  }
