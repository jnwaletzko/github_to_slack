module GithubToSlack
  class Slack < ActiveRecord::Base
   
    def notify(message)
      puts message
      puts "#{webhook_url}, #{channel_name}, #{username}"
      Slack::Notifier
        .new(webhook_url,
          channel: channel_name,
          username: username)
        .ping(":octocat: :speaker: " + message)
    end
  end
end
