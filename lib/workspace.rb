def Workspace

  attr_accessor :users, :channel, :selected

  def initialize
    @users = []
    @channel = nil
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
