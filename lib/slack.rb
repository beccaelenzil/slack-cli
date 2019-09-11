#!/usr/bin/env ruby

require_relative "../lib/channel"
require_relative "../lib/workspace"
require_relative "../lib/recipient"
require_relative "../lib/user"

require 'awesome_print'

def main
  puts "Welcome to the Ada Slack CLI!"

  workspace = Workspace.new
  ap workspace.channels

  # TODO project

  puts "Thank you for using the Ada Slack CLI"
end

main if __FILE__ == $PROGRAM_NAME