#
# Cookbook Name:: wordpress
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# @todo: All vars need sanitization

# Create needed directory
directory node['wordpress']['dir'] do
	owner "root"
	group "root"
	mode 00755
	action :create
end

# Checkout the WordPress files
execute "clone wordpress" do
	command "cd #{ node['wordpress']['dir'] } && git clone --recursive https://github.com/WordPress/WordPress.git ."
	creates "#{ node['wordpress']['dir'] }wp-config-sample.php"
	action :run
end

# "trunk" is equivalent to "master" in the git repo
node['wordpress']['version'] = ('trunk' == node['wordpress']['version']) ? 'master' : node['wordpress']['version']

# Switch to desired version
execute "checkout required version" do
	command "git --git-dir #{ node['wordpress']['dir'] }.git checkout #{ node['wordpress']['version'] }"
	action :run
end

# Update WordPress
execute "update WordPress" do
	command "git --git-dir #{ node['wordpress']['dir'] }.git fetch"
	action :run
end

# Install or update plugins
#node['wordpress']['plugins'].each do |plugin_slug|
#	execute "install #{ plugin_slug }" do
#		command "cd #{ node['wordpress']['dir'] } && wp plugin install #{ plugin_slug } --activate"
#		creates "#{ node['wordpress']['dir'] }wp-content/plugins/#{ plugin_slug }"
#		action :run
#	end
#end