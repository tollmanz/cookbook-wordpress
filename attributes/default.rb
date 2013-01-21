# Installation directory
default['wordpress']['dir'] = '/var/www/donaldtrunk.dev/'

# WordPress installation type
default['wordpress']['version'] = 'trunk'
default['wordpress']['type']    = 'multisite'

# First user
default['wordpress']['username'] = 'admin'
default['wordpress']['password'] = 'admin'
default['wordpress']['email']    = 'admin@domain.com'

# DB information
default['wordpress']['db_name']  = 'donaldtrunk.dev'
default['wordpress']['db_user']  = 'root'
default['wordpress']['db_pass']  = 'root'
default['wordpress']['db_host']  = 'localhost'

# Plugins to install
default['wordpress']['plugins'] = [
  'debug-bar',
  'debug-bar-cron',
  'debug-bar-extender'
]

# Theme to activate/install
default['wordpress']['theme'] = 'twenty-twelve'