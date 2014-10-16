#
# Cookbook Name:: foreman
# Attributes:: default
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

default["foreman"]["packages"] = value_for_platform_family(
  "debian" => %w(
  ),
  "ubuntu" => %w(
  ),
  "suse" => %w(
    rubygem-foreman
  )
)

default["foreman"]["gems"] = value_for_platform_family(
  "debian" => %w(
    foreman
  ),
  "ubuntu" => %w(
    foreman
  ),
  "suse" => %w(

  )
)

default["foreman"]["export_format"] = value_for_platform_family(
  "debian" => "inittab",
  "ubuntu" => "upstart",
  "suse" => "systemd"
)

default["foreman"]["export_path"] = value_for_platform_family(
  "debian" => "/etc/inittab",
  "ubuntu" => "/etc/init",
  "suse" => "/etc/systemd/user"
)

default["foreman"]["executable"] = "/usr/bin/foreman"
