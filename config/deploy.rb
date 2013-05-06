require "bundler/capistrano"
require "capistrano-rbenv"

load "config/recipes/base"
load "config/recipes/nginx"
load "config/recipes/unicorn"
load "config/recipes/postgresql"
load "config/recipes/check"
load "config/recipes/monit"

set  :host, "193.183.99.251"
set :server_name, "bcs.io  www.bcs.io"
server "#{host}", :web, :app, :db, primary: true

set :application, "salon"
set :user, "deployer"
set :deploy_to, "/home/#{user}/apps/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false

set :repository, "git@github.com:BCS-io/#{application}.git"
set :scm, "git"
set :branch, "master"
set :rbenv_ruby_version, "2.0.0-p0"

set :maintenance_template_path, File.expand_path("../recipes/templates/maintenance.html.erb", __FILE__)

default_run_options[:pty] = true
ssh_options[:forward_agent] = true
# ssh_options[:keys] = [File.join(ENV["HOME"], ".vagrant.d", "insecure_rivate_key")]

after "deploy", "deploy:cleanup" # keep only the last 5 releases

