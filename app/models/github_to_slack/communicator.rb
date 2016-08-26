module GithubToSlack
  require 'slack-notifier'
  class Communicator
    attr_reader :payload

    def initialize(payload)
      @payload = payload
    end

    def build_message
      puts "Parsing json"
      params = JSON.parse(payload).with_indifferent_access

      pr_url = params[:pull_request][:html_url]
      pr_title = params[:pull_request][:title]

      action = params[:action].to_sym
      label_name = params[:label][:name]
      sender_login = params[:sender][:login]

      alert_message = "_#{sender_login}_ #{label_actions[action]} `#{label_name}` label.\nPR Title: *#{pr_title}*.\nPR Link: #{pr_url}"
    end

    def deliver_message
      Slack.first.notify(build_message)
    end

    def label_actions
      {
        labeled: :added,
        unlabeled: :removed
      }
    end
  end
end
