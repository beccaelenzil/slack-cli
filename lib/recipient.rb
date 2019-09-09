class Recipient

  attr_accessor :slack_id, :name

  def initialize(slack_id, name)
    @slack_id = slack_id
    @name = name
  end

  def send_message(message)
  end

  def self.get(url, params)
  end

  def details
    # abstract, implemented in channel and user
  end

  def self.list
    # abstract, implemented in channel and user
  end

end

