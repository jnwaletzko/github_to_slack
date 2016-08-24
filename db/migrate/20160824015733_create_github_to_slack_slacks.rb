class CreateGithubToSlackSlacks < ActiveRecord::Migration[5.0]
  def change
    create_table :github_to_slack_slacks do |t|
      t.string :webhook_url
      t.string :channel_name
      t.string :username

      t.timestamps
    end
  end
end
