module GithubToSlack
  class Repository < ActiveRecord::Base
    has_many :slackers
  end
end
