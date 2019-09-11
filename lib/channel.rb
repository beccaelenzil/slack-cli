require_relative 'recipient'
require 'httparty'
require 'dotenv'

Dotenv.load

class Channel < Recipient

  attr_accessor :topic, :member_count

  URL = 'https://slack.com/api/channels.list'
  KEY = ENV['SLACK_CLI_TOKEN']

  def initialize(slack_id, name, topic, member_count)
    super(slack_id, name)
    @topic = topic
    @member_count = member_count
  end

  def details
  end

  def self.list
    response = HTTParty.get(URL, query: {token: KEY})

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