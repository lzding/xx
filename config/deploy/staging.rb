set :rails_env, "staging"
set :deploy_to, '/usr/local/projects/box_cms'

# server-based syntax
# ======================
# Defines a single server with a list of roles and multiple properties.
# You can define all roles on a single server, or split them:

# server 'example.com', user: 'deploy', roles: %w{app db web}, my_property: :my_value
# server 'example.com', user: 'deploy', roles: %w{app web}, other_property: :other_value
server '43.225.56.170', user: 'root', roles: %w{app web db}
set :branch, '2016-03-07-add-success-list' #'update-root-logics'




# role-based syntax
# ==================

# Defines a role with one or multiple servers. The primary server in each
# group is considered to be the first unless any  hosts have the primary
# property set. Specify the username and a domain or IP for the server.
# Don't use `:all`, it's a meta role.

# role :app, %w{deploy@example.com}, my_property: :my_value
# role :web, %w{user1@primary.com user2@additional.com}, other_property: :other_value
# role :db,  %w{deploy@example.com}

# role :app, %w{boxzs.com}
# role :web, %w{boxzs.com}
# role :db, %w{boxzs.com}


# Configuration
# =============
# You can set any configuration variable like in config/deploy.rb
# These variables are then only loaded and set in this stage.
# For available Capistrano configuration variables see the documentation page.
# http://capistranorb.com/documentation/getting-started/configuration/
# Feel free to add new variables to customise your setup.



# Custom SSH Options
# ==================
# You may pass any option but keep in mind that net/ssh understands a
# limited set of options, consult the Net::SSH documentation.
# http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start
#
# Global options
# --------------
#  set :ssh_options, {
#    keys: %w(/home/rlisowski/.ssh/id_rsa),
#    forward_agent: false,
#    auth_methods: %w(password)
#  }
#
# The server-based syntax can be used to override options:
# ------------------------------------
# server 'example.com',
#   user: 'user_name',
#   roles: %w{web app},
#   ssh_options: {
#     user: 'user_name', # overrides user setting above
#     keys: %w(/home/user_name/.ssh/id_rsa),
#     forward_agent: false,
#     auth_methods: %w(publickey password)
#     # password: 'please use keys'
#   }

# task :push_configs do
#   on roles(:web,:app) do
#       # database.yml
#       config = { "production" => {
#           "adapter"  => "mysql2",
#           "database" => "boxzs",
#           "host"     => "boxzs.com",
#           "username" => "boxzs",
#           "password" => "boxroot@812",
#           "pool"     => "5"
#       } }
#       puts config.to_yaml, "#{release_path}/config/database.yml"
#   end
# end

# before 'deploy:assets:precompile', :push_configs