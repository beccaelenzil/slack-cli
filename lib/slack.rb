#!/usr/bin/env ruby

require_relative "../lib/channel"
require_relative "../lib/workspace"
require_relative "../lib/recipient"
require_relative "../lib/user"

require 'awesome_print'

def main
  puts "Welcome to the Ada Slack CLI!"

  workspace = Workspace.new
  running = true
  
  while running
    puts "What would you like to do: 'list channels', 'list users', or 'quit':"
    command = gets.chomp

    case command 
      when 'list channels'
        ap workspace.channels
      when 'list users'
        ap workspace.users
      when 'quit'
        running = false
      else
        puts "Enter a valid command"
    end
  end
  

  # TODO project

  puts "Thank you for using the Ada Slack CLI"
end

main if __FILE__ == $PROGRAM_NAME