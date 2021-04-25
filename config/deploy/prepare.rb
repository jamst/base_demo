puts 'use prepare'

set :user, 'deploy'
set :domain, 'youdomain'
set :deploy_to, '/var/www/base_demo'
set :repository, 'git@youdomain:/home/git/base_demo'
set :branch, 'prepare'
set :rails_env, 'prepare'
