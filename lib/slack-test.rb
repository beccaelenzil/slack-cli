#!/usr/bin/env ruby

require_relative "../lib/channel"
require_relative "../lib/workspace"
require_relative "../lib/recipient"
require_relative "../lib/user"

require 'awesome_print'



recipient = nil
workspace = Workspace.new

response = workspace.send_message('random', 'hello!!!!')
puts response 