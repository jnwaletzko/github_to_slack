$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "github_to_slack/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "github_to_slack"
  s.version     = GithubToSlack::VERSION
  s.authors     = ["jnwaletzko"]
  s.email       = ["jnwaletzko@gmail.com"]
  s.homepage    = "https://www.github.com/jnwaletzko"
  s.summary     = "GithubToSlack."
  s.description = "RailsEngine to manage slack notifications from GitHub"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 4.2"
  s.add_dependency "slack-notifier"

  s.add_development_dependency "sqlite3"
end
