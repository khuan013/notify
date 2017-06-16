class Message < ApplicationRecord
  after_create_commit { notify }
 
  private
 
  def notify
    Notification.create(event: "New Message: #{self.body} ")
  end
end