module GithubToSlack
  class Slack < ActiveRecord::Base
   
    def notify(message)
      Slack::Notifier
        .new(webhook_url,
          channel: channel_name,
          username: user_name)
        .ping(":octocat: :speaker: " + message)
    end
  end
end
