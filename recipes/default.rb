#
# Cookbook Name:: mysql-chef_gem
# Recipe:: default
#
# Copyright 2008-2013, Chef Software, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "build-essential"

if node["mysql-chef_gem"]["gem"]["manual_install"]
  execute "manual_install" do
    action :run
    command "#{node["mysql-chef_gem"]["gem"]["bin"]} install #{node["mysql-chef_gem"]["gem"]["name"]} -q --no-rdoc --no-ri -v '#{node["mysql-chef_gem"]["gem"]["version"]}' --source=#{node["mysql-chef_gem"]["gem"]["repo"]}"
    not_if "#{node["mysql-chef_gem"]["gem"]["bin"]} query -i -n #{node["mysql-chef_gem"]["gem"]["name"]} -v '#{node["mysql-chef_gem"]["gem"]["version"]}'"
  end
else
  mysql_chef_gem "default" do
  action :install
  source node["mysql-chef_gem"]["gem"]["repo"]
  end
end
