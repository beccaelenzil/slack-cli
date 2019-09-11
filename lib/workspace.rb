require 'dotenv'
require 'httparty'
Dotenv.load

class Workspace

  attr_accessor :users, :channels, :selected

  def initialize
    @users = User.list
    @channels = Channel.list
    @selected = nil
  end

  def select_channel
  end

  def select_user
  end

  def show_details
  end

  def send_message
  end

end
