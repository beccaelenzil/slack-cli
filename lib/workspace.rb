require 'dotenv'
require 'httparty'
require 'table_print'
Dotenv.load

class Workspace

  URL = 'https://slack.com/api/chat.postMessage'
  KEY = ENV['SLACK_CLI_TOKEN']

  attr_accessor :users, :channels, :selected

  def initialize
    @users = User.list
    @channels = Channel.list
    @selected = nil
  end

  def list_users
    tp @users, :real_name, :slack_id, :user_name => {:display_method => :name}
  end

  def list_channels
    tp @channels, :name, :member_count, :slack_id
  end

  def select_channel(input)
    the_recipient = @channels.find do |recipient|
      recipient.name == name || recipient.slack_id == input
    end

    return the_recipient
  end

  def select_user(input)
    the_recipient = @users.find do |recipient|
      recipient.name == name || recipient.slack_id == input
    end

    return the_recipient
  end

  def show_details(recipient)
    return recipient.details
  end

  def send_message(recipient, message)
    recipient.send_message(message)
  end

end
