class CreateGithubToSlackRepositories < ActiveRecord::Migration
  def change
    create_table :github_to_slack_repositories do |t|
      t.integer :github_id
      t.string :name

      t.timestamps null: false
    end
  end
end
