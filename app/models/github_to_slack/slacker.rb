module GithubToSlack
  require 'slack-notifier'
  class Slacker < ActiveRecord::Base
    belongs_to :repository
    
    def notify(message)
      Slack::Notifier
        .new(webhook_url,
          channel: channel_name,
          username: username)
        .ping(":octocat: :speaker: " + message)
    end
  end
end
