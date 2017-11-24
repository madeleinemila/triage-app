class CreateFixesIssues < ActiveRecord::Migration[5.1]
  def change
    create_table :fixes_issues, :id => false do |t|
      t.integer :fix_id
      t.integer :issue_id
    end
  end
end
