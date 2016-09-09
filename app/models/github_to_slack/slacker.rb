module GithubToSlack
  require 'slack-notifier'
  require 'attr_encrypted'
  class Slacker < ActiveRecord::Base
    belongs_to :repository

    attr_encrypted :ssn, key: "sU2*We8Z8hpd7GwGdkDu!DqLmkAOf0Pk8pO7f^&R"
    
    def notify(message)
      Slack::Notifier
        .new(webhook_url,
          channel: channel_name,
          username: username)
        .ping(":octocat: :speaker: " + message)
    end
  end
end
