require 'dotenv'
require 'httparty'
Dotenv.load

class Recipient
  attr_accessor :slack_id, :name

  URL = 'https://slack.com/api/'
  POST_URL = 'https://slack.com/api/chat.postMessage'
  KEY = ENV['SLACK_CLI_TOKEN']
  BOT_KEY = ENV['BOT_TOKEN']

  def initialize(slack_id, name)
    @slack_id = slack_id
    @name = name
  end


  def details
    # abstract, implemented in channel and user
    raise NotImplementedError
  end

  def send_message(message)
    response = HTTParty.post(POST_URL, body: {
        token: BOT_KEY,
        channel: self.slack_id,
        text: message
    })

    return response
  end

  def self.get(url)
    response = HTTParty.get(URL+url, query: {token: KEY})
    return response
  end

  def self.list
    # abstract, implemented in channel and user
    raise NotImplementedError
  end

  def details
    raise NotImplementedError, "Can't implement from recipient class."
  end

end

