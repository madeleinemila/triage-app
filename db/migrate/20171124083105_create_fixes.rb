class CreateFixes < ActiveRecord::Migration[5.1]
  def change
    create_table :fixes do |t|
      t.text :title
      t.text :steps

      t.timestamps
    end
  end
end
