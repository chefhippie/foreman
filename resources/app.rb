#
# Cookbook Name:: foreman
# Resource:: app
#
# Copyright 2013-2014, Thomas Boerger <thomas@webhippie.de>
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

actions :export

attribute :root, :kind_of => String, :name_attribute => true
attribute :app, :kind_of => String, :default => nil
attribute :user, :kind_of => String, :default => nil
attribute :group, :kind_of => String, :default => nil
attribute :port, :kind_of => Integer, :default => nil
attribute :log, :kind_of => String, :default => nil
attribute :procfile, :kind_of => String, :default => nil
attribute :env, :kind_of => [Array, NilClass], :default => nil
attribute :concurrency, :kind_of => [Hash, NilClass], :default => nil
attribute :content, :kind_of => [Hash, NilClass], :default => nil

default_action :export
