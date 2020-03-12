require_relative 'recipient'

class User < Recipient

  attr_accessor :real_name, :status_text, :status_emoji

  def initialize(slack_id, name, real_name, status_text, status_emoji)
    super(slack_id, name)
    @real_name = real_name
    @status_text = status_text
    @status_emoji = status_emoji
  end

  def details
    return "User #{@name}'s status is #{@status_text} #{@status_emoji}. Their real name is #{@real_name}."
  end

  def self.list
    response = self.get('users.list')
    users = response["members"].map do |user|
      self.new(
        user["id"], 
        user["name"], 
        user["real_name"],
        user["status_text"],
        user["status_emoji"]
      )
    end
    return users
  end
  
end