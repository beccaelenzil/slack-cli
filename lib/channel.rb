require_relative 'recipient'
require 'httparty'
require 'dotenv'

Dotenv.load

class Channel < Recipient

  attr_accessor :topic, :member_count

  #URL = 'https://slack.com/api/channels.list'
  KEY = ENV['SLACK_CLI_TOKEN']

  def initialize(slack_id, name, topic, member_count)
    super(slack_id, name)
    @topic = topic
    @member_count = member_count
  end

  def details
    return "Channel #{@name}'s topic is #{@topic["value"]}. It has #{@member_count} members."
  end

  def self.list
    response = self.get("channels.list")

    channels = response["channels"].map do |channel|
      self.new(
        channel["id"], 
        channel["name"], 
        channel["topic"],
        channel["num_members"]
      )
    end
    return channels
  end
end