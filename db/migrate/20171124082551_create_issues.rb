class CreateIssues < ActiveRecord::Migration[5.1]
  def change
    create_table :issues do |t|
      t.text :summary
      t.text :details
      t.integer :popularity

      t.timestamps
    end
  end
end
