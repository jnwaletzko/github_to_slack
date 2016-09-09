class CreateGithubToSlackSlackers < ActiveRecord::Migration
  def change
    create_table :github_to_slack_slackers do |t|
      t.string :encrypted_webhook_url
      t.string :encrypted_webhook_url_iv
      t.string :channel_name
      t.string :username
      t.integer :repository_id

      t.timestamps null: false
    end
  end
end
