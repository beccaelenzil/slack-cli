#!/usr/bin/env ruby

require_relative "../lib/channel"
require_relative "../lib/workspace"
require_relative "../lib/recipient"
require_relative "../lib/user"

require 'awesome_print'

def main
  puts "Welcome to the Ada Slack CLI!"

  recipient = nil
  workspace = Workspace.new
  running = true

  while running
    puts " "
    puts "What would you like to do: 'list channels', 'list users', 'select channel', 'select user', 'details', 'send message', or 'quit':"
    command = gets.chomp
    puts " "

    case command 
      when 'list channels'
        ap workspace.list_channels
      when 'list users'
        ap workspace.list_users
      when 'select user'
        puts "Input the name or slack id of the user: "
        input = gets.chomp
        recipient = workspace.select_user(input)
        puts "Unable to find that user" if recipient.nil?
      when 'select channel'
        puts "Input the name or slack id of the channel: "
        input = gets.chomp
        recipient = workspace.select_channel(input)
        puts "Unable to find that channel" if recipient.nil?
      when 'details'
        if recipient
          puts workspace.details(recipient)
        else
          puts "You must first select a user or channel."
        end
      when 'send message'
        if recipient
          puts "What do you want to say?"
          message = gets.chomp
          workspace.send_message(recipient, message)
        else
          puts "You must first select a user or channel."
        end
      when 'quit'
        running = false
      else
        puts "Enter a valid command"
      end
  end

  puts "Thank you for using the Ada Slack CLI"
end

main if __FILE__ == $PROGRAM_NAME