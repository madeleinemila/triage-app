class CreateIssuesTechnologies < ActiveRecord::Migration[5.1]
  def change
    create_table :issues_technologies, :id => false do |t|
      t.integer :issue_id
      t.integer :technology_id
    end
  end
end
