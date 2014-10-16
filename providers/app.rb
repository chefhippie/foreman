#
# Cookbook Name:: bundler
# Provider:: app
#
# Copyright 2013, Thomas Boerger
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

require "chef/dsl/include_recipe"
include Chef::DSL::IncludeRecipe

action :export do
  unless new_resource.content.nil?
    template procfile.to_s do
      mode 0644
      owner new_resource.username
      group new_resource.group || new_resource.username

      cookbook "foreman"
      source "procfile.conf.erb"

      variables(
        "content" => new_resource.content
      )
    end
  end

  execute "foreman_export_#{app}" do
    command "#{foreman_bin} #{global_arguments} export #{export_arguments} #{export_format} #{export_path}"
    cwd root.to_s
    action :run

    user new_resource.user
    group new_resource.group || new_resource.user
  end

  new_resource.updated_by_last_action(true)
end

protected

def app
  new_resource.app || root.basename
end

def procfile
  if new_resource.procfile.nil?
    root.join "Procfile"
  else
    Pathname.new new_resource.procfile
  end
end

def root
  Pathname.new new_resource.root
end

def global_arguments
  [].tap do |arg|
    arg.push ["--root", root]

    unless new_resource.procfile.nil?
      arg.push ["--procfile", new_resource.procfile]
    end

    unless new_resource.env.nil?
      arg.push ["--env", new_resource.env.join(",")]
    end
  end.flatten.join(" ")
end

def export_arguments
  [].tap do |arg|
    arg.push ["--app", app]

    %w(
      user
      port
      log
    ).each do |current|
      unless new_resource.send(current).nil?
        arg.push ["--#{current}", new_resource.send(current)]
      end
    end

    unless new_resource.concurrency.nil?
      concurrency = new_resource.concurrency.to_a.map do |current|
        current.join("=")
      end

      arg.push ["--concurrency", concurrency.join(",")]
    end
  end.flatten.join(" ")
end

def export_format
  node["foreman"]["export_format"]
end

def export_path
  node["foreman"]["export_path"]
end

def foreman_bin
  node["foreman"]["foreman_bin"]
end
