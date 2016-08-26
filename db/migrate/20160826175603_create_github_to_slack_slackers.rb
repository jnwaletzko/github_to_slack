class CreateGithubToSlackSlackers < ActiveRecord::Migration
  def change
    create_table :github_to_slack_slackers do |t|
      t.string :webhook_url
      t.string :channel_name
      t.string :username

      t.timestamps null: false
    end
  end
end
