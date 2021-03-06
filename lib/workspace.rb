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

  def self.select(recipient_array)
    type = recipient_array.first.class.to_s.downcase
  
    puts "Input the name or slack id of the #{type}: "
    input = gets.chomp
    the_recipient = recipient_array.find do |recipient|
      recipient.name == input || recipient.slack_id == input
    end
  
    if the_recipient == nil
      puts "We couldn't find that #{type}"
    end
  
    return the_recipient
  end

  def send_message(recipient, message)
    response = HTTParty.post(URL, body: {
      token: KEY,
      channel: recipient,
      text: message
    })
  end

end
