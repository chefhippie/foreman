#
# Cookbook Name:: foreman
# Attributes:: default
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

default["foreman"]["packages"] = value_for_platform_family(
  "debian" => %w(
  ),
  "suse" => [
    "ruby#{node["languages"]["ruby"]["version"].to_f}-rubygem-foreman"
  ]
)

default["foreman"]["gems"] = value_for_platform_family(
  "debian" => %w(
    foreman
  ),
  "suse" => %w(

  )
)

default["foreman"]["export_format"] = value_for_platform(
  "debian" => "inittab",
  "ubuntu" => "upstart",
  "suse" => "systemd",
  "opensuse" => "systemd"
)

default["foreman"]["export_path"] = value_for_platform(
  "debian" => "/etc/inittab",
  "ubuntu" => "/etc/init",
  "suse" => "/etc/systemd/system",
  "opensuse" => "/etc/systemd/system"
)

default["foreman"]["executable"] = "/usr/bin/foreman"
