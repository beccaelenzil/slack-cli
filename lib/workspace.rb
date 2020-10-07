require 'dotenv'
require 'httparty'
require 'table_print'

Dotenv.load

class Workspace

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
    @selected = @channels.find do |recipient|
      recipient.name == input || recipient.slack_id == input
    end

  end

  def select_user(input)
    @selected = @users.find do |recipient|
      recipient.name == input|| recipient.slack_id == input
    end
  end

  def show_details
    return @selected.details
  end

  def send_message(message)
    @selected.send_message(message)
  end

end
