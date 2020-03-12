require 'dotenv'
Dotenv.load

class Recipient
  attr_accessor :slack_id, :name

  URL = 'https://slack.com/api/'
  KEY = ENV['SLACK_CLI_TOKEN']

  def initialize(slack_id, name)
    @slack_id = slack_id
    @name = name
  end

  def send_message(message)
  end

  def details
    # abstract, implemented in channel and user
    raise NotImplementedError
  end

  def self.get(url)
    the_url = URL + url
    response = HTTParty.get(the_url, query: {token: KEY})

    return response
  end

  def self.list
    # abstract, implemented in channel and user
    raise NotImplementedError
  end

end

